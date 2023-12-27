import axios from 'axios';

export const cardModule = {
	state: () => ({
		isLocalhost: 	 true,
		cardsContent:  null,
		cardsPayments: null,
		rate:					 null,
		idCurrentCard: 1,
		isMenuVisible: false,
		isLoading: false,
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
		setCardsPayments(state, cardsPayments) {
			state.cardsPayments = cardsPayments;
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
		setIsLoading(state, isLoading) {
			state.isLoading = isLoading;
		},
	},
	
	actions: {
		async updateCards({ state, commit }, editedCard=null) {
			try {
				commit('setIsLoading', true);
				commit('setIsLocalhost');
				let url;
				if (state.isLocalhost) {
					url = '/json_database/cards.json';
					} else {
					url = '/php_modules/controller_cards.php';
				}
				let get = editedCard ? {params: editedCard} : null;
				const response = await axios.get(url, get);
				commit('setCardsContent', response.data.cardsContent);
				commit('setRate', response.data.rate);
				
				console.log('----cardModule.js: state.cardsContent----');
				console.log(state.cardsContent);
				console.log('----cardModule.js: state.rate----');
				console.log(state.rate);
				
				} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
				} finally {
				commit('setIsLoading', false);
			}
		},
		
		async updatePayments({ state, commit }, editedPayment=null) {
			try {
				commit('setIsLoading', true);
				let url;
				if (state.isLocalhost) {
					url = '/json_database/cardsPayments.json';
					} else {
					url = '/php_modules/controller_payments.php';
				}
				let get = editedPayment ? {params: editedPayment} : null;
				const response = await axios.get(url, get);
				
				console.log('----cardModule.js: response.data.get----');
				console.log(response.data.get);
				
				commit('setCardsPayments', response.data.cardsPayments);
				
				console.log('----cardModule.js: state.cardsPayments----');
				console.log(state.cardsPayments);
				} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
				} finally {
				commit('setIsLoading', false);
			}
		},
		
	},
	
	namespaced: true,
};
