/*
const tm = '20:36:00';
myTime = new Date().toLocaleTimeString("uk-UA");
console.log(myTime); // 07:41:54
tmShort = myTime.substring(0, 5);
console.log(tmShort); // 20:23

let strDate = '2023-06-23';

function strInDate(strDate) {
	strDate = new Date(strDate.replace(/(\d+)-(\d+)-(\d+)/, '$1/$2/$3'));
	strDate = strDate.toLocaleDateString('uk-UA', { weekday: "long", year: "numeric", month: "long", day: "numeric" });
	return strDate.substring(0, strDate.length - 3);
}

console.log(strInDate('1967-6-23'));
*/ // пʼятниця, 23 червня 1967


/*
const sourceTree = {
	nameTable: 'credit',
	idField: 'Credit',
	nameField: 'NameCredit',
	indexField: 'UserIndex',
	childTable: {
		nameTable: 'typepayment',
		idField: 'ID_TypePayment',
		nameField: 'NameTypePayment',
		indexField: 'UserIndex',
		childTable: {
			nameTable: 'subtypepayment',
			idField: 'ID_SubTypePayment',
			nameField: 'NameSubTypePayment',
			indexField: 'UserIndex',
		},
	},
}

key = 'Table';
log = sourceTree['child' + key]['child' + key].nameField;
console.log(log);
log2 = sourceTree.childTable['child' + key].nameField;
console.log(log2);
*/