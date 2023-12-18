const numberCard = '3423 3649 2374 3403';

function hideNumCard(numberCard) {
	let arrNum = numberCard.split(' ');
	return arrNum[0] + ' **** **** ' + arrNum[3];
}

console.log(hideNumCard(numberCard));