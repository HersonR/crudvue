import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CrearPastel from '../components/CrearPastel.vue'
import EditarPastel from '../components/EditarPastel.vue'
import ListarPastel from '../components/ListarPastel.vue'
import CrearIngrediente from '../components/CrearIngrediente.vue'
import EditarIngrediente from '../components/EditarIngrediente.vue'
import ListarIngrediente from '../components/ListarIngrediente.vue'
const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/crear',
    name: 'Crear',
    component: CrearPastel
  },
  {
    path: '/editar/:id_pastel',
    name: 'Editar',
    component: EditarPastel
  },
  {
    path: '/listar',
    name: 'Listar',
    component: ListarPastel
  },
  {
    path: '/crearI',
    name: 'CrearI',
    component: CrearIngrediente
  },
  {
    path: '/editarI/:id_ingrediente',
    name: 'EditarI',
    component: EditarIngrediente
  },
  {
    path: '/listarI',
    name: 'ListarI',
    component: ListarIngrediente
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
