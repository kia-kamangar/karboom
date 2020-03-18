import apiClient from '../apiClient'
import store from '../../packs/store'

export default {
  GET_skills( url_params = '' ) {
    console.log( 'getSkills' )
    return apiClient.get( '/skills' + url_params )
  },

  GET_skill( id ) {
    console.log( 'getSkill' )
    return apiClient.get( '/skills/' + id )
  },

  POST_skill( skill ) {
    console.log( 'postSkill' )
    return apiClient.post( '/skills', skill );
  },

  PUT_skill( id, skill ) {
    console.log( 'updateSkill' )
    return apiClient.put( '/skills/' + id, skill );
  },

  DELETE_skill( id ) {
    console.log( 'deleteSkill' )
    return apiClient.delete( '/skills/' + id );
  }
}