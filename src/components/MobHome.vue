<template>
	<div class="root">
		<div class="screenshot-1">
			<div id="scr_1">
				<div style="padding-right: 18px;padding-top: 10px;">{{ rates.buyRate }}</div>
				<div style="padding-left: 0;padding-top: 10px;">{{ rates.sellRate }}</div>
				<div style="padding-right: 5px;padding-top: 10px;"></div>
			</div>
		</div>
		<div v-if="$store.state.card.cardsContent" id="carouselExample" class="carousel slide" data-bs-touch="true">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="card_content">
						<div id="credidCard" class="card">
							<div class="item item_1">{{ $store.state.card.cardsContent.credidCard.shortNameCard }}</div>
							<div class="item item_2">{{ $store.state.card.cardsContent.credidCard.shortNumberCard }}</div>
							<div class="item item_3">{{ $store.state.card.cardsContent.credidCard.periodCard }}</div>
							<div class="item item_4">{{ $store.state.card.cardsContent.credidCard.sumCard }}</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="card_content">
						<div id="paymentCard" class="card">
							<div class="item item_1">{{ $store.state.card.cardsContent.paymentCard.shortNameCard }}</div>
							<div class="item item_2">{{ $store.state.card.cardsContent.paymentCard.shortNumberCard }}</div>
							<div class="item item_3">{{ $store.state.card.cardsContent.paymentCard.periodCard }}</div>
							<div class="item item_4">{{ $store.state.card.cardsContent.paymentCard.sumCard }}</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="card_content">
						<div id="helpCard" class="card">
							<div class="item item_1">{{ $store.state.card.cardsContent.helpCard.shortNameCard }}</div>
							<div class="item item_2">{{ $store.state.card.cardsContent.helpCard.shortNumberCard }}</div>
							<div class="item item_3">{{ $store.state.card.cardsContent.helpCard.periodCard }}</div>
							<div class="item item_4">
								<div>{{ $store.state.card.cardsContent.helpCard.sumCard }}</div>
								<div></div>
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
import axios from 'axios';
export default {
	data() {
		return {
			rates: {
				buyRate: '36.08',
				sellRate: '37.45',
			},
			/*
			cardsContent: {
				credidCard: {
					nameCard: 'Картка універсальна',
					shortNameCard: 'Картка універсальна',
					numberCard: '5363 5421 8796 8945',
					shortNumberCard: '5363 **** **** 8945',
					periodCard: '10/24',
					cvv2: '351',
					sumCard: '4 452 UAH',
				},
				paymentCard: {
					nameCard: 'Картка для виплат',
					shortNameCard: 'Картка для виплат',
					numberCard: '4149 4996 4364 8208',
					shortNumberCard: '4149 **** **** 8208',
					periodCard: '11/24',
					cvv2: '563',
					sumCard: '12 UAH',
				},
				helpCard: {
					nameCard: 'Картка єПідтримка',
					shortNameCard: 'Картка єПідтримка',
					numberCard: '4149 4992 4532 1434',
					shortNumberCard: '4149 **** **** 1434',
					periodCard: '12/25',
					cvv2: '453',
					sumCard: '0 UAH',
				},
			},
			*/
		}
	},

	methods: {
		async probaFs() {
			try {
				//const url = '/text.txt';
				const url = '/php_modules/controller_cards.php';
				//const response = await axios.get(url); // , { params: { id: '1' } }
				const response = await axios.get(url);
				console.log('----response.data----');
				console.log(response.data.cardsContent);
				//alert(response.data);
				this.probaFs2();
			} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
			} finally {
			}
		},

		async probaFs2() {
			try {
				//const url = '/text.txt';
				const url = '/php_modules/data_cards.txt';
				//const response = await axios.get(url); // , { params: { id: '1' } }
				const response = await axios.get(url);
				console.log('----2. response.data----');
				//console.log(toJSON(response.data));
				console.log(response.data);
				console.table(response.data.cardsContent);
				this.cardsContent = response.data.cardsContent;
			} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
			} finally {
			}
		},

	},

	mounted() {
		//this.$store.commit('card/setIsLocalhost');
		this.$store.dispatch('card/updateCards');
	},

}
</script>


<style>
.root {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: black;
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

	/*Встраиваем с сохр.пропорций:cover-обрезает, contain-не обрезает*/
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);
}

.bottom {
	background-color: black;
	width: 330px;
	height: 80px;
}

.item_1 {
	font-size: 26px;
}

.item_4 {
	padding-top: 20px;
	font-size: 25px;
}
</style>
