import { createStore } from "vuex";
import { cardModule } from "@/store/cardModule";

export default createStore({
	modules: {
		card: cardModule,
	}
})
