num = 1234567890.563456;
num = 1234567890;

result = num.toFixed(2); // string (две цифры после зяпятой, toLocaleString()-почему-то три )
result = parseFloat(result); // number (опять в число для toLocaleString())
result2 = result.toLocaleString('ru-RU', { style: 'currency', currency: 'USD' }).replace(',', '.').replace('$', '').trim(); // string (toLocaleString()-разделение на разряды, но почему то три цифры после зяпятой)
//result = num.toFixed(2).parseFloat().toLocaleString().replace(',', '.'); // в строку черз точку нельзя
console.log(result2); // 1 234 567 890.56

result3 = num.toLocaleString().replace(',', '.');
console.log(result3); // 1 234 567 890.563 (если изначально 'xxxxxx.xx', то покатит)

let arrCurr = ['UAH', 'USD', 'EUR'];
let reqVal = num.toLocaleString('en-GB', { style: 'currency', currency: arrCurr[1] });

console.log(reqVal);

str = num.toFixed(2);
console.log(str);

myDate = new Date().toLocaleDateString('ru-RU', { weekday: "long", year: "numeric", month: "long", day: "numeric" }); // short/long
console.log(myDate);

myDate = new Date().toLocaleDateString('uk-UA', { weekday: "long", year: "numeric", month: "long", day: "numeric" });
console.log(myDate); // понеділок, 4 грудня 2023 р. Date.parse('HH:mm');

myTime = new Date().toLocaleTimeString("uk-UA");
console.log(myTime); // 07:41:54

myTime = new Date().toLocaleTimeString("uk-UA", { hour: 'numeric', minute: 'numeric' });
console.log(myTime); // 07:57