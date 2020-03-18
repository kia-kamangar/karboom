import apiClient from '../apiClient'
import store from '../../packs/store'

export default {
  GET_companies( url_params = '' ) {
    console.log( 'companies' )
    return apiClient.get( "/companies" + url_params)
  },

  GET_company( id ) {
    console.log( 'company' )
    return apiClient.get( "/companies/" + id )
  },

  POST_company( company ) {
    console.log( 'companies' )
    if ( store.state.current_user ) {
      return apiClient.post( "/companies", company);
    } else {
      return apiClient.post("/companies", company);
    }
  },

  PUT_company( id, company ) {
    console.log('company > ', company)
    return apiClient.put( "/companies/" + id, company);
  }
}