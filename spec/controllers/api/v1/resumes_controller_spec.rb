require 'rails_helper'

RSpec.describe Api::V1::ResumesController, type: :controller do
  context 'GET resume#index' do
    it 'should return successful response' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      resume = create :resume, user_id: user.id

      sign_in( user )
      get :index
      expect(response).to be_successful
    end
  end

  context 'POST resume#create' do
    it 'should create a resume' do
    user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      resume = create :resume
      valid_resume_params = {
        resume: {
          resume_title: 'test',
          start_date: nil,
          start_date: nil,
        }
      }

      sign_in( user )
      expect{ post :create, params:valid_resume_params }.to change(Resume, :count).by(1)
    end
  end

  context 'GET resume#show' do
    it 'should return 200 response' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      resume = create :resume, user_id: user.id

      sign_in( user )
      get :show, params: {id: resume.id}
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT resume#update' do
    it 'should change resume attributes' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      resume = create :resume, user_id: user.id
      valid_resume_params = {
        id: resume.id,
        resume: {
          resume_title: 'new test',
          start_date: nil,
          end_date: nil,
        }
      }

      sign_in( user )
      put :update, params: valid_resume_params
      resume.reload
      expect(resume.resume_title).to eq('new test')
    end
  end

  context 'GET resume#destroy' do
    it 'should destroy a resume' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      resume = create :resume, user_id: user.id
      count = Resume.count

      sign_in( user )
      delete :destroy, params: { id: resume.id }
      expect(Resume.count).to eq( count - 1 )
    end
  end
end
