<?php
	$data = [];
	$filename = "../../public/json_database/cardsPayments.json";
	require 'config.php';
	$currIdDatePayment = 0;
	$totalSum = 0;
	
	$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);
	
	$resultCards = $connect->query("SELECT * FROM card;");
	if ($resultCards) {
		$count_cards = $resultCards->num_rows;
		for ($k = 0; $k < $count_cards; ++$k) {
			$resultCards->data_seek($k);
			$arrCards = $resultCards->fetch_array(MYSQLI_ASSOC);
			$idCatd = $arrCards['id_card'];
			$sql = "
			SELECT payment.*, day_payment.date_payment, 
			type_payment.name_type_payment 
			FROM 
			(payment 
			LEFT JOIN day_payment ON payment.id_date_payment = day_payment.id_date_payment) 
			LEFT JOIN type_payment ON payment.id_type_payment = type_payment.id_type_payment 
			WHERE payment.id_card=$idCatd 
			ORDER BY 
			day_payment.date_payment DESC,
			payment.time_payment DESC;
			";
			$result = $connect->query($sql);
			if ($result) {
				$count_rows = $result->num_rows;
				for ($j = 0; $j < $count_rows; ++$j) {
					$result->data_seek($j);
					$arrFields = $result->fetch_array(MYSQLI_ASSOC);
					if ($arrFields['id_date_payment'] !== $currIdDatePayment) { // новый день
						if (isset($row_payment)) { // не первая запись
							$row_payment['totalSum'] = $totalSum;
							$data['cardsPayments']['card_' . $idCatd][] = $row_payment;
							$totalSum = 0;
							unset($row_payment);
						}
						$currIdDatePayment = $arrFields['id_date_payment'];
						$row_payment = array(
						'id_date_payment' => $arrFields['id_date_payment'],
						'date_payment' 		=> $arrFields['date_payment'],
						'totalSum' 				=> 0,
						);
					}
					$row_payment['payments'][] = array(
					'id_payment' 				=> $arrFields['id_payment'],
					'id_type_payment' 	=> $arrFields['id_type_payment'],
					'name_type_payment' => $arrFields['name_type_payment'],
					'time_payment' 			=> $arrFields['time_payment'],
					'purpPayment' 			=> $arrFields['purpPayment'],
					'sumPayment' 				=> $arrFields['sumPayment'],
					);
					$totalSum += $arrFields['sumPayment'];
					
					if($j == $count_rows - 1){ // последняя запись(следующей интерации не будет!)
						$row_payment['totalSum'] = $totalSum;
						$data['cardsPayments']['card_' . $idCatd][] = $row_payment;
						unset($row_payment);
					}
					
					unset($arrFields);
				}
			}
		}
	}
	
	$connect->close();
	
	$data = json_encode($data, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION); // без JSON_NUMERIC_CHECK будет из числового(5) - строковое("5") (см.  https://habr.com/ru/articles/483492/ )
	file_put_contents($filename, $data);
	echo $data;
