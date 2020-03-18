require 'spec_helper'
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context 'POST #create' do
    # Successfull Action For Admin
    it 'successfully authenticate for Admin User' do
      create :admin_user, email: 'test@test.com', password: '111111A'

      post :create, params: { user: { email: 'test@test.com', password: '111111A' } }
      expect(response.status).to eq(201)
    end

    it 'successfully authenticate for expert User' do
      create :customer_user, email: 'user@test.com', password: '111111A'

      post :create, params: { user: { email: 'user@test.com', password: '111111A' } }

      expect(response.status).to eq(201)
    end
  end

  context 'DELETE #response_to_on_destroy' do
    # Successfull Action for logout
    it 'returns a successful logout response' do
      admin_user = create(:admin_user, email: 'test@test.com', password: '111111A')
      sign_in(admin_user)

      delete :destroy

      expect(response.status).to eq(200)
    end
  end
end
