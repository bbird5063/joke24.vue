import { createRouter, createWebHistory } from 'vue-router';
import CardHome from '@/pages/cards/CardHome.vue';
import CardPayment from '@/pages/cards/CardPayment.vue';

const routes = [
	{
		path: '/',
		component: CardHome,
	},
	{
		path: '/CardHome',
		component: CardHome,
	},
	{
		path: '/CardPayment',
		component: CardPayment,
	},
];

const router = createRouter({
	routes,
	history: createWebHistory(process.env.BASE_URL),
});

export default router;
