<template>
	<div>
		<mob-credit v-if="$store.state.card.currentCard == 'credidCard'"></mob-credit>
		<mob-payment v-if="$store.state.card.currentCard == 'paymentCard'"></mob-payment>
		<mob-help v-if="$store.state.card.currentCard == 'helpCard'"></mob-help>
		<mob-list></mob-list>
	</div>
</template>

<script>
import MobList from '@/components/MobList';
import MobCredit from '@/components/MobCredit';
import MobPayment from '@/components/MobPayment';
import MobHelp from '@/components/MobHelp';
import axios from 'axios';

export default {
	components: {
		MobList,
		MobCredit,
		MobPayment,
		MobHelp
	},
	data() {
		return {
		};
	},

	methods: {},
}
</script>


<style></style>
