<?php
	$data = [];
	$filename = 'data_cards.txt';
	require 'config.php';
	
	$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);
	$sql = "SELECT * FROM card;";
	$result = $connect->query($sql);
	if ($result) {
		$count_rows = $result->num_rows;
		for ($j = 0 ; $j < $count_rows ; ++$j) {
			$result->data_seek($j);
			$arrFields = $result->fetch_array(MYSQLI_ASSOC);
			$data['cardsContent'][$arrFields['key_card']] = $arrFields;
			unset($arrFields);
		}
	}
	$connect->close();
	
	$data_cards = json_encode($data);
	file_put_contents($filename, $data_cards);
	
	echo json_encode($data);
?>