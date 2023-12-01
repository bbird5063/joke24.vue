<template>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img src="~@/assets/img/icons/logo_privat24_round.png"
					alt="logo_privat24_round.png" width="30" height="30" class="d-inline-block align-text-top"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a @click.prevent="$router.push('/CardHome')" class="nav-link active" aria-current="page" href="#">Вид</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Редактирование
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Кредитная</a></li>
							<li><a class="dropdown-item" href="#">Платежная</a></li>
							<li><a class="dropdown-item" href="#">є-Підтримка</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Общие</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</template>

<script>
//import { mapState, mapGetters, mapActions, mapMutations } from 'vuex';
export default {
	data() {
		return {
			currentPoint: '',
		};
	},
	methods: {
		//...mapActions({
		//	fadeOut: 'auth/fadeOut',
		//	fadeIn: 'auth/fadeIn',
		//}),
		//activePoint(point) {
		//	this.$router.push(point.path);
		//	this.currentPoint = point.name;
		//},
		//openAuthModal(authModal, authMode) {
		//this.$emit('openModal', authModal);
		//this.$store.commit('auth/setAuthMode', authMode);
		//},
	},
};
</script>

<style scoped></style>
