require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do

  context "company#index" do
    it "returns http success" do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company

      sign_in( admin_user )
      get :index
      expect(response).to be_successful
    end
  end

  context 'Post company#create' do
    it 'should create a company and return 200 response' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company
      company_params = {
        company: {
          name: 'test',
          about: 'about test',
          image: nil,
          background_image: nil,
          address: 'test',
          tel: '123',
        }
      }

      sign_in( admin_user )
      expect { post :create, params: company_params }.to change(Company, :count).by(1)
    end
  end

  context 'GET company#show' do
    it 'should return a successful or 200 status response' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company

      sign_in( admin_user )
      get :show, params: { id: company.id }
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT company#update' do
    it 'should change company attribuets' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company
      company_params = {
        id: company.id,
        company: {
          name: 'new test',
          about: 'new about test',
          image: nil,
          background_image: nil,
          address: 'new test',
          tel: '321',
        }
      }

      sign_in( admin_user )
      put :update, params: company_params
      company.reload
      expect(company.tel).to eq( 321 )
    end
  end

  context 'GET company#destroy' do
    it 'should destroy the company' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      company = create :company
      count = Company.count

      sign_in( admin_user )
      delete :destroy, params: { id: company.id }
      expect(Company.count).to eq(count - 1)
    end
  end
end
