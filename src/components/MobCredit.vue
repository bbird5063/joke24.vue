<template>
	<div class="root">
		<div v-show="!cardVisible" class="cardHeader">
			<!--<img src="~@/assets/img/cards/credit/00_header.png" alt="00_header.png" width="350px" height="60px">-->
		</div>
		<div v-show="cardVisible" class="card">
		</div>

		<div @click="cardVisible = !cardVisible" class="listPayment">
			<i class="fa fa-window-minimize"></i>
			<transition name="spab">
				<div v-show="!cardVisible">
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
					П'ятниця, 13 жовтня 2023 1 947.00 UAH
					20:36
					Зі своєї картки 41**08
					1 947.00
					-2 887.89
					Четвер, 12 жовтня 2023 -20.00 UAH
					04:07
					Комісія за обслуговування (членський внесок) за 09.2023
					-20.00
					-4 834.89
					П'ятниця, 06 жовтня 2023 243.97 UAH
					02:43
					Зі своєї картки 41**08
					243.97
					-4 814.89
					Неділя, 01 жовтня 2023 -179.41 UAH
					00:00
					Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 179.41 UAH
					-179.41
					-5 058.86
					Середа, 20 вересня 2023 -57.57 UAH
					12:16
					+380686803471
					-57.57
					2.00
					-4 879.45
					Четвер, 14 вересня 2023 -40.39 UAH
					12:29
					TOB «ГК «Нафтогаз України» (Київ)
					-40.39
					1.00
					-4 821.88
					Середа, 13 вересня 2023 -1 044.10 UAH
					04:38
					Oplata komunal'nykh posluh
					-1 044.10
					-4 781.49
					Вівторок, 12 вересня 2023 -20.00 UAH
					03:42
					Комісія за обслуговування (членський внесок) за 08.2023
					-20.00
					-3 737.39
					П'ятниця, 08 вересня 2023 3 560.96 UAH
					13:43
					Зі своєї картки 41**08
					3 210.00
					-3 717.39
					13:29
					Зі своєї картки 41**08
					350.96
					-6 927.39
					П'ятниця, 01 вересня 2023 -259.14 UAH
					00:00
					Списання відсотків за використання кредитного ліміту. За ставкою 3.4 відсотка нараховано 259.14 UAH
					-259.14
					-7 278.35
				</div>
			</transition>
		</div>

	</div>
</template>

<script>
export default {
	data() {
		return {
			cardVisible: true,
		}
	},

	methods: {},
}

</script>

<style scoped>
.root {
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: black;
}

.card {
	display: flex;
	flex-direction: column;
	width: 350px;
	height: 406px;
	justify-content: space-evenly;
	align-items: flex-start;
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);
	background-image: url('~@/assets/img/cards/credit/cardCredit.jpg');
}

/* cover / contain */
.cardHeader {
	width: 350px;
	height: 80px;
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat;
	background-color: rgba(0, 0, 0, 0.5);
	background-image: url('~@/assets/img/cards/credit/00_header.png');
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