import apiClient from '../apiClient'
import store from '../../packs/store'

export default {
  GET_users( url_params = '' ) {
    console.log( 'getUsers' )
    return apiClient.get( "/users" + url_params)
  },

  GET_user( id ) {
    console.log( 'getUser' )
    return apiClient.get( "/users/" + id )
  },

  POST_user( user ) {
    console.log( 'postUsers' )
    if ( store.state.current_user ) {
      return apiClient.post( "/users", user);
    } else {
      return apiClient.post("/users", user);
    }
  },

  PUT_user( id, user ) {
    console.log( 'updateUser ' )
    return apiClient.put( "/users/" + id, user);
  }
}