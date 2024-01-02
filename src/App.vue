<template>
	<navbar v-if="$store.state.card.isMenuVisible"></navbar>
	<div class="app">
		<router-view></router-view>
	</div>
</template>

<script>
import Navbar from '@/components/Navbar';
export default {
	components: {
		Navbar,
	},
	mounted() {
		this.$store.dispatch('card/updateCards');
		this.$store.dispatch('card/updatePayments');
		this.$store.dispatch('card/updateDatalist');
	},
};
</script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.app {
	padding: 0;
}
</style>
