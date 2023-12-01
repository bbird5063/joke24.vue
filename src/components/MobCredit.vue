<template>
	<div v-if="cardsContent" class="root">
		<div v-show="!cardVisible" class="cardHeader">
			<div @click="$router.push('/CardHome')" class="item item_1"></div>
			<div class="item item_2"></div>
			<div class="item item_3"></div>
			<div class="item item_4"></div>
		</div>
		<div v-show="cardVisible" class="card">
			<div @click="$router.push('/CardHome')" class="item item_1"></div>
			<div class="item item_2"></div>
			<div class="item item_3"></div>
			<div class="item item_4"></div>
			<div class="item item_5"></div>
			<div class="item item_6">{{ cardsContent.credidCard.shortNumberCard }}</div>
			<div class="item item_7">{{ cardsContent.credidCard.periodCard }}</div>
			<div class="item item_8">CVV2</div>
			<div class="item item_9"></div>
			<div class="item item_10">{{ cardsContent.credidCard.sumCard.toFixed(2) + ' UAH' }}</div>
			<div class="item item_11"></div>
			<div class="item item_12">{{ cardsContent.credidCard.limitCard.toFixed(2) + ' UAH&nbsp;&nbsp;' }}<i
					class="fa fa-chevron-right"></i></div>
			<div class="item item_13"></div>
			<div class="item item_14">{{ cardsContent.credidCard.debtCard.toFixed(2) + ' UAH&nbsp;&nbsp;' }}<i
					class="fa fa-chevron-right"></i></div>
			<div class="item item_15"></div>
			<div class="item item_16">{{ cardsContent.credidCard.minSumCard.toFixed(2) + ' UAH&nbsp;&nbsp;' }}<i
					class="fa fa-info"></i></div>
			<div class="item item_17"></div>
		</div>
		<div class="listPayment">
			<div @click="cardVisible = !cardVisible" style="text-align:center;">
				<i class="fa fa-window-minimize"></i>
			</div>
			<div>
				Середа, 01 листопада 2023 -130.42 UAH
				00:00
				Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 130.42 UAH
				-130.42
				-3 055.68
				Неділя, 15 жовтня 2023 -37.37 UAH
				11:47
				+380686803471
				-37.37
				2.00
				-2 925.26
			</div>
		</div>
	</div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from 'vuex'
export default {
	data() {
		return {
			cardVisible: true,
		}
	},

	methods: {},
	computed: {
		...mapState({
			cardsContent: state => state.card.cardsContent,
		}),
	},


}

</script>

<style scoped>
.root {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: black;
	width: 100%;
}

.card,
.listPayment,
.cardHeader {
	width: 350px;
}

.cardHeader {
	height: 46px;
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	grid-auto-rows: 46px;
	grid-column-gap: 0;
	/* url('~@/assets/img/cards/cardCredit.jpg'); */
	background-image: url('~@/assets/img/cards/cardCredit.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);

	font-size: 18px;
	font-weight: 400;
	color: white;

	border-radius: 0;
}

.card {
	height: 406px;
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	grid-template-rows: 46px 78px 30px 48px 38px 29px 34px 37px 65px;
	grid-column-gap: 0;

	background-image: url('~@/assets/img/cards/cardCredit.jpg');
	/* cover/contain */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);

	font-size: 18px;
	font-weight: 400;
	color: white;

	border-radius: 0;
}


.item {
	/*border: 1px solid black;*/
	text-align: right;
	padding-right: 20px;
}

.item_2 {
	grid-column-start: 2;
	grid-column-end: 5;
}

.item_5,
.item_6,
.item_17 {
	grid-column-start: 1;
	grid-column-end: 7;
}

.item_7,
.item_9 {
	grid-column-start: 1;
	grid-column-end: 3;
}

.item_8,
.item_10 {
	grid-column-start: 3;
	grid-column-end: 7;
}

.item_11,
.item_13,
.item_15 {
	grid-column-start: 1;
	grid-column-end: 4;
}

.item_12,
.item_14,
.item_16 {
	grid-column-start: 4;
	grid-column-end: 7;
}


.item_5 {
	font-size: 28px;
	font-weight: 600;
	text-align: left;
	padding-left: 19px;
}

.item_6 {
	font-size: 22px;
	font-weight: 600;
	text-align: left;
	padding-left: 19px;
}

.item_7 {
	font-size: 22px;
	font-weight: 500;
	text-align: left;
	padding-left: 20px;
	padding-top: 5px;
}

.item_8 {
	font-size: 20px;
	font-weight: 400;
	text-align: left;
	padding-left: 5px;
	padding-top: 8px;
}

.item_10 {
	font-size: 22px;
	font-weight: 700;
	text-align: right;
	padding-top: 1px;
}

.item_12 {
	font-size: 18px;
	font-weight: 400;
	text-align: right;
	padding-top: 2px;
}

.item_14 {
	font-size: 18px;
	font-weight: 400;
	text-align: right;
	padding-top: 6px;
}

.item_16 {
	font-size: 18px;
	font-weight: 400;
	text-align: right;
	padding-top: 5px;
}

.fa-chevron-right {
	font-size: 12px;
}

.listPayment {
	background-color: black;
	color: rgb(153, 153, 153);
	height: 500px;
}



.spab-item {
	display: inline-block;
	margin-right: 10px;
}

.spab-enter-active,
.spab-leave-active {
	/*transition: all 0.4s ease;*/
	transition: all 0.9 s ease;
}

.spab-enter-from,
.spab-leave-to {
	opacity: 0;
	transform: translateY(130px);
}

.spab-move {
	transition: transform 0.4s ease;
}
</style>
