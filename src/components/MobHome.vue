<template>
	<div v-if="$store.state.card.cardsContent && $store.state.card.rate" class="root">
		<div class="screenshot-1">
			<div id="scr_1">
				<div style="padding-right: 18px;padding-top: 10px;">{{ $store.state.card.rate.buyRate }}</div>
				<div style="padding-left: 0;padding-top: 10px;">{{ $store.state.card.rate.sellRate }}</div>
				<div style="padding-right: 5px;padding-top: 10px;"></div>
			</div>
		</div>
		<div id="carouselExample" class="carousel slide" data-bs-touch="true">
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
