<template>
	<div v-if="cardsContent && rate" class="root">
		<div class="screenshot-1">
			<div id="scr_1">
				<div style="padding-right: 18px; padding-top: 10px;">{{ rate.buyRate }}</div>
				<div style="padding-left: 0;padding-top: 10px;">{{ rate.sellRate }}</div>
				<div style="padding-right: 5px;padding-top: 10px;"></div>
			</div>
		</div>
		<div id="carouselExample" class="carousel slide" data-bs-touch="true">
			<div class="carousel-inner">
				<div class="carousel-item"  :class="{active: idCurrentCard==1}">
					<div class="card_content">
						<div id="credidCard" @click="openCurrentCard(1)" class="card">
							<div class="item item_1">{{ cardsContent.card_1.shortNameCard }}</div>
							<div class="item item_2">{{ cardsContent.card_1.shortNumberCard }}</div>
							<div class="item item_3">{{ cardsContent.card_1.periodCard }}</div>
							<div class="item item_4">
								<div>{{ numStrFormat(cardsContent.card_1.sumCard)  + ' UAH' }}</div>
								<img src="~@/assets/img/cards/icon_5.png" alt="icon_5.png" width="57" height="38">
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item" :class="{active: idCurrentCard==2}">
					<div class="card_content">
						<div id="paymentCard" @click="openCurrentCard(2)" class="card">
							<div class="item item_1">{{ cardsContent.card_2.shortNameCard }}</div>
							<div class="item item_2">{{ cardsContent.card_2.shortNumberCard }}</div>
							<div class="item item_3">{{ cardsContent.card_2.periodCard }}</div>
							<div class="item item_4">
								<div>{{ numStrFormat(cardsContent.card_2.sumCard)  + ' UAH' }}</div>
								<img style="margin-top:5px;" src="~@/assets/img/cards/icon_6.png" alt="icon_6.png" width="68" height="26">
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item" :class="{active: idCurrentCard==3}">
					<div class="card_content">
						<div id="helpCard" @click="openCurrentCard(3)" class="card">
							<div class="item item_1">{{ cardsContent.card_3.shortNameCard }}</div>
							<div class="item item_2">{{ cardsContent.card_3.shortNumberCard }}</div>
							<div class="item item_3">{{ cardsContent.card_3.periodCard }}</div>
							<div class="item item_4">
								<div>{{ numStrFormat(cardsContent.card_3.sumCard)  + ' UAH' }}</div>
								<img style="margin-top:5px;" src="~@/assets/img/cards/icon_6.png" alt="icon_6.png"
								width="68" height="26"><!--padding-left: 16px;-->
							</div>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
			</button>
		</div>
		<div class="screenshot-2">
			<div id="scr_2">
			</div>
		</div>
		<div class="bottom">
		</div>
	</div>
</template>

<script>
	import { mapState, mapGetters, mapActions, mapMutations } from 'vuex'
	import functionsMixin from '@/mixins/functionsMixin';
	export default {
		mixins: [functionsMixin],
		data() {
			return {
			}
		},
		
		methods: {
			...mapMutations({
				setIdCurrentCard: 'card/setIdCurrentCard',
				
			}),
			...mapActions({
				updateCards: 'card/updateCards'
			}),
			
			openCurrentCard(idCard) {
				this.setIdCurrentCard(idCard);
				this.$router.push('/CardPayment');
			},
		},
		
		computed: {
			...mapState({
				cardsContent: state => state.card.cardsContent,
				rate: state => state.card.rate,
				idCurrentCard: state => state.card.idCurrentCard,
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
	background-color: #212121;
	}
	
	.card {
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: flex-start;
	font-size: 23px;
	font-weight: 700;
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	width: 330px;
	height: 206px;
	border-radius: 17px;
	
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);
	}
	
	.screenshot-1,
	.screenshot-2 {
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: flex-start;
	font-size: 18px;
	width: 330px;
	}
	
	.screenshot-1 {
	height: 100px;
	}
	
	.screenshot-2 {
	height: 290px;
	}
	
	#credidCard {
	background-image: url('~@/assets/img/cards/credidCard.jpg');
	color: white;
	}
	
	#paymentCard {
	background-image: url('~@/assets/img/cards/paymentCard.jpg');
	color: white;
	}
	
	#helpCard {
	background-image: url('~@/assets/img/cards/helpCard.jpg');
	}
	
	#scr_1 {
	background-image: url('~@/assets/img/cards/Screenshot_1.jpg');
	display: flex;
	/*justify-content: space-evenly;*/
	/*justify-content: space-between;*/
	justify-content: center;
	color: white;
	}
	
	#scr_2 {
	background-image: url('~@/assets/img/cards/Screenshot_2.jpg');
	}
	
	
	#scr_1,
	#scr_2 {
	width: 100%;
	height: 100%;
	background-color: #212121;
	
	/*Встраиваем с сохр.пропорций:cover-обрезает, contain-не обрезает*/
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	/*background-color: rgba(0, 0, 0, 0.5);*/
	}
	
	.bottom {
	/*background-color: black;*/
	background-color: #212121;
	width: 330px;
	height: 80px;
	}
	
	.item_1 {
	font-size: 26px;
	}
	
	.item_4 {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding-top: 40px;
	font-size: 25px;
	}
</style>
