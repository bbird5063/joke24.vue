<template>
	<div>
		<div v-if="cardsContent" class="root">
			
			<p v-if="errorsCourses.length" style="margin-top:5px; width:360px;" class="alert alert-danger">
				<b>Пожалуйста исправьте указанные ошибки:</b>
				<ul>
					<li v-for="errorCourse in errorsCourses">{{ errorCourse }}</li>
				</ul>
			</p>
			
			<div v-if="rate" class="screenshot-1">
				<div class="scr menu"></div>
				<div class="scr buyRate">
					<input v-model="rate.buyRate" name="buyRate" type="text" class="form-control" style="text-align:right; width:78px;" title="Курс покупки">
				</div>
				<div class="scr sellRate">
					<input v-model="rate.sellRate" name="sellRate" type="text" class="form-control" style="text-align:left;" title="Курс продажи">
				</div>
				
				<div class="scr bell"></div>
				<div class="scr phone"></div>
			</div>
			<button @click="loadEditedCourses" style="margin-top: 5px; width: 360px;" type="button" class="btn btn-success">
				Сохранить курсы
			</button>	
			
			<p v-if="errorsCard.length" style="margin-top:5px; width:360px;" class="alert alert-danger">
				<b>Пожалуйста исправьте указанные ошибки:</b>
				<ul>
					<li v-for="error in errorsCard">{{ error }}</li>
				</ul>
			</p>
			
			<div v-show="cardVisible" class="card">
				<div @click="$router.push('/CardHome')" class="item item_1"></div>
				<div class="item item_2"></div>
				<div class="item item_3"></div>
				<div class="item item_4"></div>
				<div class="item item_5"></div>
				<div class="item item_6"><input v-model="cardsContent['card_' + this.idCurrentCard].numberCard" name="numberCard" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_7"><input v-model="cardsContent['card_' + this.idCurrentCard].periodCard" name="periodCard" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_8"><input v-model="cardsContent['card_' + this.idCurrentCard].cvv2" name="cvv2" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_9"></div>
				<div class="item item_10"><input v-model="cardsContent['card_' + this.idCurrentCard].sumCard" name="sumCard" style="text-align:right" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_11"></div>
				<div class="item item_12"><input v-model="cardsContent['card_' + this.idCurrentCard].limitCard" name="limitCard" style="text-align:right" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_13"></div>
				<div class="item item_14"><input v-model="cardsContent['card_' + this.idCurrentCard].debtCard" name="debtCard" style="text-align:right" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_15"></div>
				<div class="item item_16"><input v-model="cardsContent['card_' + this.idCurrentCard].minSumCard" name="minSumCard" style="text-align:right" class="form-control form-control-sm" type="text" placeholder=".form-control-sm" aria-label=".form-control-sm example"></div>
				<div class="item item_17"></div>
			</div>
			<button @click="loadEditedCard" style="margin-top: 5px; width: 360px;" type="button" class="btn btn-success">
				Сохранить данные карты
			</button>			
		</div>
	</div>
</template>

<script>
	import axios from 'axios';
	import { mapState, mapGetters, mapActions, mapMutations } from 'vuex';
	import functionsMixin from '@/mixins/functionsMixin';
	
	export default {
		mixins: [functionsMixin],
		props: {
			cardVisible: {
				type: Boolean,
				default: true,
			}
		},
		data() {
			return {
				isLoading: false,
				errorsCourses: [],
				errorsCard: [],
				/*editCard: null,*/
			}
		},
		
		methods: {
			...mapMutations({
				setIsLoading: 'card/setIsLoading',
			}),
			
			...mapActions({
				updateCards: 'card/updateCards'
			}),
			
			loadEditedCourses() {
				this.errorsCourses = [];
				if (!this.rate.buyRate) {
					this.errorsCourses.push('Введите курс покупки;');
				}
				else if(!this.isNumeric(this.rate.buyRate)) {
					this.errorsCourses.push('Введите в поле "курс покупки" корректное значение "xx.xx";');
				}	
				if (!this.rate.sellRate) {
					this.errorsCourses.push('Введите курс продажи;');
				}
				else if(!this.isNumeric(this.rate.sellRate)) {
					this.errorsCourses.push('Введите в поле "курс  продажи" корректное значение "xx.xx";');
				}	
				
				if(!this.errorsCourses.length) {
					this.updateCards({editedCourses: this.rate});
				}
			},
			
			loadEditedCard() {
				this.errorsCard = [];
				
				if (!this.cardsContent['card_' + this.idCurrentCard].cvv2) {
					this.errorsCard.push('Введите CVV2;');
				}
				else if(!this.isNumeric(this.cardsContent['card_' + this.idCurrentCard].cvv2) || this.cardsContent['card_' + this.idCurrentCard].cvv2.length !== 3) {
					this.errorsCard.push('Введите в поле "CVV2" корректное значение "xxx";');
				}
				
				if(!this.errorsCard.length) {
					this.updateCards({editedCard: this.cardsContent['card_' + this.idCurrentCard]});
				}
			},
		},
		
		computed: {
			...mapState({
				cardsContent: state => state.card.cardsContent,
				idCurrentCard: state => state.card.idCurrentCard,
				isLocalhost: state => state.card.isLocalhost,
				rate: state => state.card.rate,
			}),
		},
		
		mounted() {},
	}
</script>

<style scoped>
	.root {
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 100%;
	height: 100%;
	background-color: #212121;
	}
	
	.screenshot-1 {
	width: 360px;
	display: grid;
	grid-template-areas:
	'menu menu buyRate buyRate sellRate sellRate bell phone';
	
	grid-gap: 5px;
	grid-template-columns: repeat(8, 1fr);
	grid-auto-rows: 40px;
	
	/*background-color: #212121;*/
	
	/*Встраиваем с сохр.пропорций:cover-обрезает, contain-не обрезает*/
	background-size: cover;
	background-repeat: no-repeat;
	background-image: url('~@/assets/img/cards/Screenshot_1.jpg');
	height: 40px;
	}
	
	.scr {
	/*border: 1px solid grey;*/
	}
	
	.menu {
	grid-area: menu;
	}
	
	.buyRate {
	grid-area: buyRate;
	}
	
	.sellRate {
	grid-area: sellRate;
	}
	
	.bell {
	grid-area: bell;
	}
	
	.phone {
	grid-area: phone ;
	}
	
	.buyRate>input, .sellRate>input {
	border: 0;
	background: transparent;
	color: grey;
	padding-top: 9px;
	}
	
	
	
	
	.card,
	.cardHeader {
	width: 360px;
	color: white;
	margin-top: 5px;
	}
	
	.cardHeader {
	height: 46px;
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	grid-auto-rows: 46px;
	grid-column-gap: 0;
	background-image: url('~@/assets/img/cards/cardCredit.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	
	font-size: 18px;
	font-weight: 400;
	
	border-radius: 0;
	}
	
	.card {
	border: 0;
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
	
	font-size: 18px;
	font-weight: 400;
	}
	
	input {
	background: transparent;
	color: #cfcece;
	font-size: 1rem;
	}	
	
	input:focus {
	background: transparent;
	color: #dfdbdb;
	font-size: 1rem;
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
	
	.item_7 {
	grid-column-start: 1;
	grid-column-end: 3;
	}
	
	.item_8 {
	grid-column-start: 3;
	grid-column-end: 7;
	}
	
	.item_9 {
	grid-column-start: 1;
	grid-column-end: 4;
	}
	
	.item_10 {
	grid-column-start: 4;
	grid-column-end: 7;
	}
	
	.item_11,
	.item_13,
	.item_15 {
	grid-column-start: 1;
	grid-column-end: 5;
	}
	
	.item_12,
	.item_14,
	.item_16 {
	grid-column-start: 5;
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
	
</style>
