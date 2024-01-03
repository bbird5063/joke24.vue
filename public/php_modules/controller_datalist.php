<?php
	$data = [];
	$filename = "../../public/json_database/cardsDatalist.json";
	$purpPaymentShort = '';
	require 'config.php';
	
	$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);
	
	$resultCards = $connect->query("SELECT * FROM card;");
	if ($resultCards) {
		$count_cards = $resultCards->num_rows;
		for ($k = 0; $k < $count_cards; ++$k) {
			$resultCards->data_seek($k);
			$arrCards = $resultCards->fetch_array(MYSQLI_ASSOC);
			$idCard = $arrCards['id_card'];
			
			$sqlDatalist = "SELECT * FROM payment WHERE id_card=$idCard ORDER BY purpPayment;";
			$resultDatalist = $connect->query($sqlDatalist);
			$count = $resultDatalist->num_rows;
			for ($i = 0; $i < $count; ++$i) {
				$resultDatalist->data_seek($i);
				$arrDatalist = $resultDatalist->fetch_array(MYSQLI_ASSOC);
				$purpPaymentShortCurr = str_replace("\t", "", $arrDatalist['purpPayment']);
				$purpPaymentShortCurr = str_replace("\r", "", $purpPaymentShortCurr);
				$purpPaymentShortCurr = str_replace("\n", "", $purpPaymentShortCurr);
				$purpPaymentShortCurr = mb_substr($purpPaymentShortCurr, 0, 30) . '...';

				if($purpPaymentShort !== $purpPaymentShortCurr) {
					$purpPaymentShort = $purpPaymentShortCurr;
					$row_datalist = array(
					'id_payment' => $arrDatalist['id_payment'],
					'id_type_payment' => $arrDatalist['id_type_payment'],
					'purpPaymentShort' => $purpPaymentShort,
					'purpPayment' => $arrDatalist['purpPayment'],
					);
					$data['datalist']['card_' . $idCard][] = $row_datalist;
					unset($row_datalist);
				}
				unset($arrDatalist);		
			}
		}
	}
	
	$connect->close();
	
	$data = json_encode($data, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION); // без JSON_NUMERIC_CHECK будет из числового(5) - строковое("5") (см.  https://habr.com/ru/articles/483492/ )
	file_put_contents($filename, $data);
	echo $data;
