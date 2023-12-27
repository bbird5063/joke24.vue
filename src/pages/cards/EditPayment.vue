<template>
	<div>
		<div v-if="cardsContent && cardsPayments" class="root">
			<head-credit-edit v-if="idCurrentCard == 1" :cardVisible="cardVisible"></head-credit-edit>
			<head-payment-edit v-if="idCurrentCard > 1" :cardVisible="cardVisible"></head-payment-edit>
			
			<button @click="addNewRecord" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				Добавить запись
			</button>			
			
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-md"> <!-- xl lg md sm xs-->
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Редактирование</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form @submit.prevent v-if="newRecord && typePayment">
								<input v-model="newRecord.date_payment" name="date_payment" type="date" class="form-control">
								<input v-model="newRecord.time_payment" name="time_payment" type="time" class="form-control">
								<div class="input-group">
									<span class="input-group-text"> <!-- type_payment-->
										<img v-if="newRecord.id_type_payment>0" class="img_select" :src="'/img/icons/' + newRecord.id_type_payment + '.png'">
									</span>	
									<select v-model="newRecord.id_type_payment" class="form-select form-select-sm" style="height: 37.8px;"  name="id_type_payment" aria-label=".form-select-sm example">
										<option value="0" selected>--- Тип платежа ---</option>
										<option v-for="type in typePayment" :key="type.id_type_payment" :value="type.id_type_payment">
											{{ type.name_type_payment }}
										</option>
									</select>
								</div>
								<textarea v-model="newRecord.purpPayment" name="purpPayment" class="form-control" rows="3"></textarea>
								<input v-model="newRecord.sumPayment" name="sumPayment" type="text" class="form-control" style="text-align:right;">
							</form>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Отмена</button>
							<button @click="saveRecord" type="button" class="btn btn-primary">Сохранить</button>
						</div>
					</div>
				</div>
			</div>			
			
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
						<div class="pay btn_pay">
							<button @click="newRecord=row; newRecord.date_payment=payDay.date_payment; newRecord.id_card=idCurrentCard;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" title="Редактировать"><i class="fa fa-pencil"></i></button>			
							<br>
							<button @click="deleteRecond(row)" type="button" class="btn btn-secondary btn_pay" title="Удалить"><i class="fa fa-close"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import axios from 'axios';
	import { mapState, mapGetters, mapActions, mapMutations } from 'vuex';
	import functionsMixin from "@/mixins/functionsMixin";
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
				newRecord: null,
				typePayment: null,
			}
		},
		
		methods: {
			...mapMutations({
				setIsLoading: 'card/setIsLoading',
				setCardsPayments: 'card/setCardsPayments',
			}),
			...mapActions({
				updatePayments: 'card/updatePayments'
			}),
			
			addNewRecord() {
				this.newRecord = {
					id_payment: 0,
					id_type_payment: 0,
					time_payment: '',
					purpPayment: '',
					sumPayment: 0,
					date_payment: '',
					id_card: this.idCurrentCard,
				};
			},
			
			async readTypePayment() {
				try {
					this.setIsLoading(true)
					let url;
					if (this.isLocalhost) {
						url = '/json_database/typePayment.json';
					} 
					else {
						url = '/php_modules/controller_read_type.php';
					}
					
					const response = await axios.get(url);
					
					this.typePayment = response.data.typePayment;
					
					console.log('----EditPayment.vue: this.typePayment----');
					console.log(this.typePayment);
					
					} catch (e) {
					alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
					} finally {
					this.setIsLoading(false);
				}
			},
			
			deleteRecond(row) {
				if(confirm('Вы действительно хотите удалить запись?')) {
					this.updatePayments({deleteRecord: row});
				}
			},
			
			saveRecord() {
				//console.table(newRecord);
				if(this.newRecord.id_payment){
					this.updatePayments({editedRecord: this.newRecord});
					console.table({editedRecord: this.newRecord});
				}
				else{
					this.updatePayments({newRecord: this.newRecord});
					console.table({newRecord: this.newRecord});
				}
				document.querySelector(".btn-close").dispatchEvent(new Event("click"));
			},
		},
		
		computed: {
			...mapState({
				cardsContent: state => state.card.cardsContent,
				cardsPayments: state => state.card.cardsPayments,
				idCurrentCard: state => state.card.idCurrentCard,
				isLocalhost: state => state.card.isLocalhost,
				isLoading: state => state.card.isLoading,
			}),
		},
		
		mounted() {
			this.readTypePayment()
		},		
	}
</script>

<style scoped>
	
	/*
	.addRecords {
	width: 360px;
	margin-top: 20px;
	margin-bottom: 10px;
	background-color: #212121;
	}
	.addRecords input, .addRecords select, .addRecords textarea , .addRecords button  {
	margin-bottom: 5px;
	}
	*/
	
	img.img_select {
	width: 22px;
	height: 22px;
	}
	
	/*
	.type_payment {
	width: 40px;
	height: 37.8px;
	padding: 0;
	padding-left: 4px;
	}
	*/
	
	/*
	.addRecords select {
	height: 37.8px;
	}
	*/
	
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
	'icon type type sum sum'
	'icon note note note btn_pay'
	'icon time time time btn_pay';
	grid-gap: 2px;
	grid-template-columns: 40px 2fr 2fr 3fr 1fr;
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
	
	.btn_pay {
	grid-area: btn_pay;
	}
	
	.btn_pay button {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 30px;
	height: 30px;
	margin-top: 4px;
	margin-bottom: 0;
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
