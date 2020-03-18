import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state:{
    flag: false,
    auth_token: 0,
    current_user: null,
  },
  getters: {
    flag: state => state.flag,
    auth_token: state => state.auth_token,
    current_user: state => state.current_user,
  },
  mutations: {
    SET_AUTH_TOKEN(state, value){
      state.auth_token = value
      console.log('setAuthToken')
    },
    SET_CURRENT_USER(state, value){
      state.current_user = value
      console.log('setCurrent_User')
    },
    SET_FLAG(state, value){
      state.flag = value
      console.log('setFlag')
    }
  },
  actions: {
    updateAuthToken({ state, commit}, value){
      console.log("updateAuthToken")
      commit('SET_AUTH_TOKEN', value)
    },
    updateCurrentUser({ state, commit}, value){
      console.log("updateCurrentUser")
      commit('SET_CURRENT_USER', value)
    },
    updateFlag({state, commit}, value){
      console.log('updateFlag')
      commit('SET_FLAG', value)
    }
  }
})
