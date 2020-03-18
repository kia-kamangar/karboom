require 'rails_helper'

RSpec.describe Api::V1::AdvertisingsController, type: :controller do

  context '.index' do
    it 'should return successful response' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company, user: admin_user

      sign_in( admin_user )
      get :index
      expect(response).to be_successful
    end
  end

  context 'POST advertising#create' do
    it 'should create new advertising and return 200 response' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company, user: admin_user
      advertising_params = {
        advertising: {
          job_title: 'test',
          job_description: 'test',
          salary: 123000,
        }
      }

      sign_in( admin_user )
      expect{ post :create, params: advertising_params }.to change(Advertising, :count).by(1)
    end
  end

  context 'GET advertising#show' do
    it 'should return successful response' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      advertising = create :advertising

      sign_in( user )
      get :show, params: { id: advertising.id }
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT advertising#update' do
    it 'should change advertising attributes' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company, user: admin_user
      advertising = create :advertising, company_id: admin_user.company.id
      advertising_params = {
        id: advertising.id,
        advertising: {
          job_title: 'new test',
          job_description: 'new description test',
          salary: 50000,
        }
      }

      sign_in( admin_user )
      put :update, params: advertising_params
      advertising.reload
      expect(advertising.salary).to eq(50000)
    end
  end

  context 'GET advertising#destroy' do
    it 'should destroy an advertising' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company, user: admin_user
      advertising = create :advertising, company_id: admin_user.company.id

      sign_in( admin_user )
      count = Advertising.count
      delete :destroy, params: { id: advertising.id }
      expect(Advertising.count).to eq( count - 1 )
    end
  end
end