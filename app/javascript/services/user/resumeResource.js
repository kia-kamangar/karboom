import apiClient from '../apiClient'
import store from '../../packs/store'

export default {
  GET_resumes( url_params = '' ) {
    console.log( 'getResumes' )
    return apiClient.get( '/resumes' + url_params )
  },

  GET_resume( id ) {
    console.log( 'getResume' )
    return apiClient.get( '/resumes/' + id )
  },

  POST_resume( resume ) {
    console.log( 'postResume' )
    return apiClient.post( '/resumes', resume );
  },

  PUT_resume( id, resume ) {
    console.log( 'updateResume' )
    return apiClient.put( '/resumes/' + id, resume );
  },

  DELETE_resume( id ) {
    console.log( 'deleteResume' )
    return apiClient.delete( '/resumes/' + id );
  }
}