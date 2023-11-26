<template>
	<div class="card">
		<div id="credit_header" class="partCard"></div>
		<div id="credit_nameCard" class="partCard"></div>
		<div id="credit_numEndCvv2" class="partCard"></div>
		<div id="credit_access" class="partCard"></div>
		<div id="credit_limit" class="partCard"></div>
		<div id="credit_debt" class="partCard"></div>
		<div id="credit_necess" class="partCard"></div>
		<div id="credit_button" class="partCard"></div>
		<div id="credit_topList" class="partCard"></div>
	</div>
</template>

<script>
</script>

<style scoped>
.card {
	display: flex;
	width: 330px;
	flex-direction: column;
	/*flex-direction: column;
	justify-content: flex-start;
	align-items: flex-start;
	font-size: 23px;
	font-weight: 700;
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	width: 330px;
	height: 206px;
	border-radius: 17px;*/

	/*background-image: url('~@/assets/img/cards/credidCard.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);*/
}

/* cover / contain */
.partCard {
	align-items: flex-start;
	width: 100%;
	/*height: 80px;*/
	padding: 0;
	margin: 0;
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);

}


#credit_header {
	background-image: url('~@/assets/img/cards/credit/00_header.png');
	height: 56px;
}

#credit_nameCard {
	background-image: url('~@/assets/img/cards/credit/01_nameCard.png');
	height: 63px;
}

#credit_numEndCvv2 {
	background-image: url('~@/assets/img/cards/credit/02_numEndCvv2.png');
	height: 70px;
}

#credit_access {
	background-image: url('~@/assets/img/cards/credit/03_access.png');
	height: 34px;
}

#credit_limit {
	background-image: url('~@/assets/img/cards/credit/04_limit.png');
	height: 33px;
}

#credit_debt {
	background-image: url('~@/assets/img/cards/credit/05_debt.png');
	height: 29px;
}

#credit_necess {
	background-image: url('~@/assets/img/cards/credit/06_necess.png');
	height: 31px;
}

#credit_button {
	background-image: url('~@/assets/img/cards/credit/07_button.png');
	height: 62px;
}

#credit_topList {
	background-image: url('~@/assets/img/cards/credit/08_topList.png');
	height: 27px;
}
</style>