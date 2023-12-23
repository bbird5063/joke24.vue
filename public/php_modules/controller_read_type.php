<?php
	$data = [];
	$filename = '../../public/json_database/typePayment.json';
	require 'config.php';
	
	$connect = new mysqli(BBR_DBSERVER, BBR_DBUSER, BBR_DBPASSWORD, BBR_DATABASE);
	$sql = "SELECT * FROM type_payment ORDER BY order_by;";
	$result = $connect->query($sql);
	if ($result) {
		$count_rows = $result->num_rows;
		for ($j = 0; $j < $count_rows; ++$j) {
			$result->data_seek($j);
			$arrFields = $result->fetch_array(MYSQLI_ASSOC);
			$data['typePayment'][] = $arrFields;
			unset($arrFields);
		}
	}
	
	$connect->close();
	
	$data = json_encode($data, JSON_NUMERIC_CHECK | JSON_PRESERVE_ZERO_FRACTION); // без JSON_NUMERIC_CHECK будет из числового(5) - строковое("5") (см.  https://habr.com/ru/articles/483492/ )
	file_put_contents($filename, $data);
	echo $data;
	
