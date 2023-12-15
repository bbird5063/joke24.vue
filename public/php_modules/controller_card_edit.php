<?php
	$data = [];
	$filename = '../../public/json_database/cards.json';
	//$idCard = $_GET['id_card'];
	require 'config.php';
	
	$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);
	
	if(isset($_GET['editCard'])) {
		$arrCard = $_GET['editCard'];
	}
	
	$sql = "SELECT * FROM card;";
	$result = $connect->query($sql);
	if ($result) {
		$count_rows = $result->num_rows;
		for ($j = 0; $j < $count_rows; ++$j) {
			$result->data_seek($j);
			$arrFields = $result->fetch_array(MYSQLI_ASSOC);
			$data['cardsContent']['card_' . $arrFields['id_card']] = $arrFields;
			unset($arrFields);
		}
	}
	
	$sql = "SELECT * FROM rate;";
	$result = $connect->query($sql);
	if ($result) {
		$result->data_seek(0);
		$arrFields = $result->fetch_array(MYSQLI_ASSOC);
		$data['rate']['buyRate'] = $arrFields['buyRate'];
		$data['rate']['sellRate'] = $arrFields['sellRate'];
	}
	$connect->close();
	
	$data = json_encode($data, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION); // без JSON_NUMERIC_CHECK будет из числового(5) - строковое("5") (см.  https://habr.com/ru/articles/483492/ )
	file_put_contents($filename, $data);
	echo $data;
