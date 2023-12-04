export default {
	methods: {
		numStrFormat(num) {
			let str = num.toFixed(2);
			num = parseFloat(str);
			return num.toLocaleString('ru-RU', { style: 'currency', currency: 'USD' }).replace(',', '.').replace('$', '').trim();
		},
		
		strInDate(strDate) {
			strDate = new Date(strDate.replace(/(\d+)-(\d+)-(\d+)/, '$1/$2/$3'));
			strDate = strDate.toLocaleDateString('uk-UA', { weekday: "long", year: "numeric", month: "long", day: "numeric" });
			return strDate.substring(0, strDate.length - 3); // удаляем ' p.'
		},
	},
}
