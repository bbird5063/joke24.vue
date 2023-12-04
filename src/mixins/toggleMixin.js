export default {
	methods: {
		numStrFormat(num) {
			let str = num.toFixed(2);
			num = parseFloat(str);
			return num.toLocaleString('ru-RU', { style: 'currency', currency: 'USD' }).replace(',', '.').replace('$', '').trim();
		},
	},
}
