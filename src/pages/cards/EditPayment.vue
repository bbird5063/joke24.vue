<template>
	<div>
		<div v-if="cardsContent && cardsPayments" class="root">
			<head-credit-edit v-if="$store.state.card.idCurrentCard == 1" :cardVisible="cardVisible"></head-credit-edit>
			<head-payment-edit v-if="$store.state.card.idCurrentCard > 1" :cardVisible="cardVisible"></head-payment-edit>
			
			
			<div class="listPayment">
				<div @click="cardVisible = !cardVisible" style="text-align:center;">
					<div v-if="isLoading">
						<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
						<span class="sr-only">Загрузка...</span>
					</div>
					<i v-else class="fa fa-window-minimize"></i>
				</div>
			</div>
			
			<div v-for="payDay in cardsPayments['card_' + idCurrentCard]" :key="payDay.id_date_payment" class="payment_days">
				<div class="pay day">{{ strInDate(payDay.date_payment) }}</div>
				<div class="pay total">{{ numStrFormat(payDay.totalSum) + ' UAH&nbsp;&nbsp;' }}</div>
				<div class="div_payments">
					<div v-for="row in  payDay.payments" :key="row.id_payment" class="pay payments">
						<div class="pay icon"><img class="img_icon" :src="'/img/icons/' + row.id_type_payment + '.png'" alt="">
						</div>
						
						<div class="pay type">{{ row.name_type_payment }}</div>
						<div class="pay sum" :class="{ 'sum_green': row.sumPayment > 0 }">{{ numStrFormat(row.sumPayment) + ' UAH &nbsp;&nbsp;' }}</div>
						<div class="pay note">{{ row.purpPayment }}</div>
						<div class="pay time">{{ row.time_payment.substring(0, 5) }}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import axios from 'axios';
	import { mapState, mapGetters, mapActions, mapMutations } from 'vuex';
	import functionsMixin from '@/mixins/functionsMixin';
	import HeadCreditEdit from "@/components/HeadCreditEdit";
	import HeadPaymentEdit from "@/components/HeadPaymentEdit";
	
	export default {
		mixins: [functionsMixin],
		components: {
			HeadCreditEdit,
			HeadPaymentEdit,
		},
		data() {
			return {
				cardVisible: true,
				editPayment: null,
			}
		},
		
		methods: {
			async updateEdit() {
				try {
					this.editPayment = await this.cardsPayments['card_' + this.idCurrentCard];
					console.log(this.editPayment);
					} catch (e) {
					alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
					} finally {
				}
			}
		},
		
		computed: {
			...mapState({
				cardsContent: state => state.card.cardsContent,
				cardsPayments: state => state.card.cardsPayments,
				idCurrentCard: state => state.card.idCurrentCard,
				isLoading: state => state.card.isLoading,
			}),
		},
		
		mounted() {
			//this.updateEdit()
		},		
	}
</script>

<style scoped>
	img.icon {
	width: 30px;
	height: 30px;
	}
	
	.root {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #212121;
	width: 100%;
	height: 100%;
	}
	
	.listPayment,
	.payment_days {
	width: 360px;
	}
	
	
	
	.fa-chevron-right {
	font-size: 12px;
	}
	
	.listPayment {
	background-color: #212121;
	color: #999999;
	}
	
	
	.payment_days {
	padding: 10px;
	display: grid;
	/*justify-content: center;*/
	grid-template-areas:
	'day total'
	'div_payments div_payments';
	
	grid-gap: 5px;
	grid-template-columns: 5fr 3fr;
	grid-template-rows: 40px 1fr;
	
	color: #999999;
	}
	
	.div_payments {
	grid-area: div_payments;
	}
	
	.payments {
	
	
	display: grid;
	grid-template-areas:
	'icon type type sum'
	'icon note note note'
	'icon time time time';
	grid-gap: 2px;
	grid-template-columns: 40px 2fr 2fr 3fr;
	grid-template-rows: 20px 1fr 30px;
	}
	
	.pay {
	padding: 0px;
	/*border: 1px solid grey;*/
	}
	
	.day {
	grid-area: day;
	}
	
	.total {
	grid-area: total;
	text-align: right;
	}
	
	.icon {
	grid-area: icon;
	align-self: start;
	}
	
	.type {
	grid-area: type;
	}
	
	.sum {
	grid-area: sum;
	text-align: right;
	color: #E2E2E2;
	font-size: 16px;
	font-weight: 700;
	
	}
	
	.note {
	grid-area: note;
	color: #E2E2E2;
	}
	
	.time {
	grid-area: time;
	}
	
	img.img_icon {
	width: 30px;
	height: 30px;
	}
	
	.sum_green {
	color: green;
	/*font-weight: 800;*/
	font-size: 18px;
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
