import axios from 'axios';

export const cardModule = {
	state: () => ({
		isLocalhost: true,
		cardsContent: null,
		rate: null,
		currentCard: 'credidCard',
	}),

	mutations: {
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
		setCardsContent(state, cardsContent) {
			state.cardsContent = cardsContent;
		},
		setRate(state, rate) {
			state.rate = rate;
		},
		setCurrentCard(state, currentCard) {
			state.currentCard = currentCard;
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
