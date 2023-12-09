<template>
	<div>
		<div v-if="cardsContent" class="root" :class="{card_payment: idCurrentCard==2, card_help: idCurrentCard==3}">
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
				<div class="item item_6" @click="visibleNumberCard">{{ numberCard }}</div>
				<div class="item item_7">{{ cardsContent['card_' + idCurrentCard].periodCard }}</div>
				<div class="item item_8" @click="visibleCvv2">{{ cvv2 }}</div>
				<div class="item item_9"></div>
				<div class="item item_10">{{ numStrFormat(cardsContent['card_' + idCurrentCard].sumCard) + ' UAH&nbsp;&nbsp;' }}</div>
			</div>
		</div>
	</div>
</template>

<script>
	import axios from 'axios';
	import { mapState, mapGetters, mapActions, mapMutations } from 'vuex';
	import toggleMixin from '@/mixins/toggleMixin';
	
	export default {
		mixins: [toggleMixin],
		props: {
			cardVisible: {
				type: Boolean,
				default: true,
			}
		},
		data() {
			return {
				cvv2: 'CVV2',
				numberCard: '',
				paymentDays: null,
				isLoading: false,
				
			}
		},
		
		methods: {
			visibleNumberCard() {
				if(this.numberCard.trim() !== this.cardsContent['card_' + this.idCurrentCard].numberCard) {
					setTimeout(() => {
						this.numberCard = this.cardsContent['card_' + this.idCurrentCard].numberCard;
					}, 1000)
				}
			},
			visibleCvv2() {
				if(this.cvv2.trim() !== this.cardsContent['card_' + this.idCurrentCard].cvv2) {
					setTimeout(() => {
						this.cvv2 = '\u00A0\u00A0' + this.cardsContent['card_' + this.idCurrentCard].cvv2;
					}, 1000)
				}
			},
		},
		
		computed: {
			...mapState({
				cardsContent: state => state.card.cardsContent,
				idCurrentCard: state => state.card.idCurrentCard,
			}),
		},
		
		mounted() {
				this.numberCard = this.cardsContent['card_' + this.idCurrentCard].shortNumberCard;
		},
	}
</script>

<style scoped>
	.root {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: 100%;
	color: white;
	background-color: #212121;
	}

	.card,
	.cardHeader {
	width: 360px;
	}
	
	.card_payment > .cardHeader {
	background-image: url('~@/assets/img/cards/cardPayment.jpg');
	}
	
	.card_help > .cardHeader {
	background-image: url('~@/assets/img/cards/cardHelp.jpg');
	}
	
	.cardHeader {
	height: 46px;
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	grid-auto-rows: 46px;
	grid-column-gap: 0;
	background-size: cover;
	background-repeat: no-repeat;
	
	font-size: 18px;
	font-weight: 400;
	}
	
	.card_payment > .card {
	background-image: url('~@/assets/img/cards/cardPayment.jpg');
	color: white;
	}
	
	.card_help > .card {
	background-image: url('~@/assets/img/cards/cardHelp.jpg');
	color: black;
	}
	
	.card {
	border: 0;
	height: 218px;
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	grid-template-rows: 46px 45px 30px 48px 38px;
	grid-column-gap: 0;
	
	/* cover/contain */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	/*background-color: #212121;*/
	
	font-size: 18px;
	font-weight: 400;
	
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
	
	.item_7{
	grid-column-start: 1;
	grid-column-end: 2;
	}
	
	.item_8 {
	grid-column-start: 2;
	grid-column-end: 7;
	}

	.item_9 {
	grid-column-start: 1;
	grid-column-end: 3;
	}
	
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
	/*изменять через моб*/
	padding-left: 7px;
	padding-top: 7px;
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
