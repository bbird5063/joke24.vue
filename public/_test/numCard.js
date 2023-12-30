const numberCard = '3423 3649 2374 3403';

function hideNumCard(numberCard) {
	let arrNum = numberCard.split(' ');
	return arrNum[0] + ' **** **** ' + arrNum[3];
}

function isNumeric(n) {
	//return !isNaN(parseFloat(n)) & amp;& amp; isFinite(n);
	return !isNaN(parseFloat(n)) && isFinite(n);
	
}
	
console.log(hideNumCard(numberCard));

let number = 1212.9;
console.log(isNumeric(number));