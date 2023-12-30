export default {
	methods: {
		numStrFormat(num) {
			let str = num.toFixed(2);
			num = parseFloat(str);
			return num.toLocaleString('ru-RU', { style: 'currency', currency: 'USD' }).replace(',', '.').replace('$', '').trim();
		},
		
		strInDate(strDate, year=false) {
			strDate = new Date(strDate.replace(/(\d+)-(\d+)-(\d+)/, '$1/$2/$3'));
			strDate = strDate.toLocaleDateString('uk-UA', { weekday: "long", year: "numeric", month: "long", day: "numeric" });
			return year ? strDate : strDate.substring(0, strDate.length - 3); // удаляем ' p.'
		},
		
		hideNumCard(numberCard) {
			let arrNum = numberCard.split(' ');
			return arrNum[0] + ' **** **** ' + arrNum[3];
		},
		
		isNumeric(n) {
			return !isNaN(parseFloat(n)) && isFinite(n);
		},
		
		validate_date(value) {
			var arrD = value.split("-");
			arrD[1] -= 1;
			var d = new Date(arrD[0], arrD[1], arrD[2]);
			if ((d.getFullYear() == arrD[0]) && (d.getMonth() == arrD[1]) && (d.getDate() == arrD[2])) {
				return true;
			} 
			else {
				return false;
			}
		},		
		
		async queryDb(filePhp, fileJson, get=null) {
			try {
				this.setIsLoading(true)
				let url;
				if (this.isLocalhost) {
					url = '/json_database/' + fileJson;
				} 
				else {
				url = '/php_modules/' + filePhp;
				}
				
				const response = await axios.get(url, get);
				
				console.log('----' + url +':----');
				console.log(response.data);
				
				return response;
				} catch (e) {
				alert('Ошибка ' + e.name + ':' + e.message + '\n' + e.stack);
				} finally {
				this.setIsLoading(false);
			}
		},
		
		
		
	},
}
