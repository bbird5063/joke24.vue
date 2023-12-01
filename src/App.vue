<template>
	<navbar v-if="!$store.state.card.isLocalhost"></navbar>
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
