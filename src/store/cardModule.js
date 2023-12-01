import axios from 'axios';

export const cardModule = {
	state: () => ({
		isLocalhost: true,
		cardsContent: null,
		rate: null,
		idCurrentCard: 1,
		isMenuVisible: false,
	}),

	mutations: {
		setIsLocalhost(state) {
			if (
				location.hostname.includes('192.168.0.100') ||
				location.hostname.includes('localhost')
			) {
				state.isLocalhost = true;
				state.isMenuVisible = true; // true
			} else {
				state.isLocalhost = false;
				state.isMenuVisible = true;
			}
		},
		setCardsContent(state, cardsContent) {
			state.cardsContent = cardsContent;
		},
		setRate(state, rate) {
			state.rate = rate;
		},
		setIdCurrentCard(state, idCurrentCard) {
			state.idCurrentCard = idCurrentCard;
		},
		setIsMenuVisible(state, isMenuVisible) {
			state.isMenuVisible = isMenuVisible;
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
				commit('setRate', response.data.rate);

				console.log('----cardModule.js: state.cardsContent----');
				console.log(state.cardsContent);
				console.log('----cardModule.js: state.rate----');
				console.log(state.rate);

			} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
			} finally {
			}
		},
	},

	namespaced: true,
};
