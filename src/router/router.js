import { createRouter, createWebHistory } from 'vue-router';
import CardHome from '@/pages/cards/CardHome.vue';
import CardList from '@/pages/cards/CardList.vue';

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
		path: '/CardList',
		component: CardList,
	},
];

const router = createRouter({
	routes,
	history: createWebHistory(process.env.BASE_URL),
});

export default router;
