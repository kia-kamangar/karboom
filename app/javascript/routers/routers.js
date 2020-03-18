import routes from '../routes/routes'
import VueRouter from 'vue-router'

const router = new VueRouter({
  mode: 'history',
  base: '/',
  routes
})

export default router