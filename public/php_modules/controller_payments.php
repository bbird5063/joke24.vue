<?php
	
	$data = [];
	$filename = "../../public/json_database/cardsPayments.json";
	require 'config.php';
	$currIdDatePayment = 0;
	$totalSum = 0;
	
	$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);

	if(isset($_GET['newRecord'])){
		$id_date_payment = idDatePayment($connect, $_GET['newRecord']['date_payment']);
		
		$arrPaymentFields = [];
		$arrPaymentValues = [];
		foreach($_GET['newRecord'] as $field => $value) {
			if($field!=='id_payment' && $field!=='id_date_payment' && $field!=='date_payment' && $field!=='name_type_payment'){
				$arrPaymentFields[] = $field;
				$arrPaymentValues[] = "'$value'";
			}
		}
		$arrPaymentFields[] = 'id_date_payment';
		$arrPaymentValues[] = "'$id_date_payment'";
		
		$fields = implode(',' , $arrPaymentFields);
		$values = implode(',' , $arrPaymentValues);
		$sql = "INSERT INTO payment ($fields) VALUES ($values);";
		
		
		$sql = "
		INSERT INTO `payment` (`id_date_payment`, `id_card`, `id_type_payment`, `time_payment`, `purpPayment`, `sumPayment`) VALUES ( 
		$id_date_payment ," . 
		$_GET['newRecord']['id_card'] . "," .
		$_GET['newRecord']['id_type_payment'] . ",'" .
		$_GET['newRecord']['time_payment'] . "','" .
		$_GET['newRecord']['purpPayment'] . "'," .
		$_GET['newRecord']['sumPayment'] . ");";
		
		$connect->query($sql);
	}
	
	if(isset($_GET['editedRecord'])){
		$id_date_payment = idDatePayment($connect, $_GET['editedRecord']['date_payment']);
		$id_payment = $_GET['editedRecord']['id_payment'];
		
		
		$arrPaymentFields = [];
		foreach($_GET['editedRecord'] as $field => $value) {
			if($field!=='id_payment' && $field!=='id_date_payment' && $field!=='date_payment' && $field!=='name_type_payment'){
				$arrPaymentFields[] = "$field='$value'";
			}
		}
		$arrPaymentFields[] = "id_date_payment='$id_date_payment'";
		
		$set = implode(',' , $arrPaymentFields);
		$sql = "UPDATE payment SET $set WHERE id_payment = $id_payment";
		
		
		$sql = "UPDATE `payment` SET " . 
		"`id_date_payment`='$id_date_payment'," . 
		"`id_card`='" . $_GET['editedRecord']['id_card'] . "'," .
		"`id_type_payment`='" . $_GET['editedRecord']['id_type_payment'] . "'," .
		"`time_payment`='" . $_GET['editedRecord']['time_payment'] . "'," .
		"`purpPayment`='" . $_GET['editedRecord']['purpPayment'] . "'," .
		"`sumPayment`='" . $_GET['editedRecord']['sumPayment'] . "'" .
		" WHERE `id_payment`=$id_payment;";
		
		
		$connect->query($sql);
	}

	if(isset($_GET['deleteRecord'])){
		$id_payment = $_GET['deleteRecord']['id_payment'];
		$sql = "DELETE FROM payment WHERE id_payment = $id_payment;";
		$connect->query($sql);
	}

	
	$resultCards = $connect->query("SELECT * FROM card;");
	if ($resultCards) {
		$count_cards = $resultCards->num_rows;
		for ($k = 0; $k < $count_cards; ++$k) {
			$resultCards->data_seek($k);
			$arrCards = $resultCards->fetch_array(MYSQLI_ASSOC);
			$idCard = $arrCards['id_card'];
			$sql = "
			SELECT payment.*, day_payment.date_payment, 
			type_payment.name_type_payment 
			FROM 
			(payment 
			LEFT JOIN day_payment ON payment.id_date_payment = day_payment.id_date_payment) 
			LEFT JOIN type_payment ON payment.id_type_payment = type_payment.id_type_payment 
			WHERE payment.id_card=$idCard 
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
							$data['cardsPayments']['card_' . $idCard][] = $row_payment;
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
					
					if($j == $count_rows - 1){ //save последняя запись(следующей интерации не будет!)
						$row_payment['totalSum'] = $totalSum;
						$data['cardsPayments']['card_' . $idCard][] = $row_payment;
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


 

	function idDatePayment(&$connect, $date_payment) {
		//$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);
		$sql = "SELECT id_date_payment FROM day_payment WHERE date_payment='$date_payment';";
		$result = $connect->query($sql);
		$count_rows = $result->num_rows;
		if($count_rows == 0) {
			$sql = "INSERT INTO day_payment (date_payment) VALUES ('$date_payment');";
			$connect->query($sql);
			return $connect->insert_id;
		}
		else {
			$result->data_seek(0);
			$arrFields = $result->fetch_array(MYSQLI_ASSOC);
			return $arrFields['id_date_payment'];
		}
	}
