import apiClient from '../apiClient'
import store from '../../packs/store'

export default {
  GET_demands( url_params = '' ) {
    console.log( 'getDemands' )
    return apiClient.get( '/demands' + url_params )
  },

  GET_demand( id ) {
    console.log( 'getDemand' )
    return apiClient.get( '/demands/' + id )
  },

  POST_demand( demand ) {
    console.log( 'postDemand' )
    return apiClient.post( '/demands', demand );
  },

  PUT_demand( id, demand ) {
    console.log( 'updateDemand' )
    return apiClient.put( '/demands/' + id, demand );
  },

  DELETE_demand( id ) {
    console.log( 'deleteDemand' )
    return apiClient.delete( '/demands/' + id );
  }
}