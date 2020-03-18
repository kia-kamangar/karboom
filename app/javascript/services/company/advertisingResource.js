import apiClient from '../apiClient'
import store from '../../packs/store'

export default {
  GET_advertisings( url_params = '' ) {
    console.log( 'getAdvertisings' )
    return apiClient.get( '/advertisings' + url_params )
  },

  GET_advertising( id ) {
    console.log( 'getAdvertising' )
    return apiClient.get( '/advertisings/' + id )
  },

  POST_advertising( advertising ) {
    console.log( 'postAdvertising' )
    return apiClient.post( '/advertisings', advertising );
  },

  PUT_advertising( id, advertising ) {
    console.log( 'updateAdvertising' )
    return apiClient.put( '/advertisings/' + id, advertising );
  },

  DELETE_advertising( id ) {
    console.log( 'deleteAdvertising' )
    return apiClient.delete( '/advertisings/' + id );
  }
}