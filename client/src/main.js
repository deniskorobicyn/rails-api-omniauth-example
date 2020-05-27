import Vue from 'vue'
import App from './App.vue'
import GAuth from 'vue-google-oauth2'
import installElement from './plugins/elements/install-elements.js'
import { TOKEN } from '../local-config.js'

Vue.config.productionTip = false

const gauthOption = {
  clientId: TOKEN, 
  scope: 'email profile', 
  prompt: 'select_account'
}

Vue.use(installElement)
Vue.use(GAuth, gauthOption)

new Vue({
  render: h => h(App),
}).$mount('#app')
