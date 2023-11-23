import axios from 'axios';

export const cardModule = {
	state: () => ({
		cardsContent: null,
		isLocalhost: false,
	}),

	mutations: {
		setCardsContent(state, cardsContent) {
			state.cardsContent = cardsContent;
		},
		setIsLocalhost(state) {
			if (
				location.hostname.includes('192.168.0.100') ||
				location.hostname.includes('localhost')
			) {
				state.isLocalhost = true;
			} else {
				state.isLocalhost = false;
			}
		},
	},

	actions: {
		async updateCards({ state, commit }) {
			try {
				commit('setIsLocalhost');
				let url;
				if (state.isLocalhost) {
					url = '/json_database/card.json';
				} else {
					url = '/php_modules/controller_cards.php';
				}
				const response = await axios.get(url);
				commit('setCardsContent', response.data.cardsContent);

				console.log('----cardModule.js: state.cardsContent----');
				console.log(state.cardsContent);

			} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
			} finally {
			}
		},
	},

	namespaced: true,
};
