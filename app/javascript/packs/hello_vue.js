/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import store from './store.js'
import VueAxios from 'vue-axios'
import ElementUI from 'element-ui'
import VueRouter from 'vue-router'
import App from '../components/app.vue'
import router from '../routers/routers'
import 'element-ui/lib/theme-chalk/index.css'
import userResource from '../services/user/userResource'
import skillResource from '../services/user/skillResource'
import resumeResource from '../services/user/resumeResource'
import companyResource from '../services/company/companyResource'
import advertisingResource from '../services/company/advertisingResource'

Vue.use(Vuex)
Vue.use(ElementUI)
Vue.use(VueRouter)
Vue.use(VueAxios, axios)
Vue.prototype.$userResource = userResource
Vue.prototype.$skillResource = skillResource
Vue.prototype.$resumeResource = resumeResource
Vue.prototype.$companyResource = companyResource
Vue.prototype.$advertisingResource = advertisingResource

let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
  	router,
    store,
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
