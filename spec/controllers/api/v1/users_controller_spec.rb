require 'rails_helper'
require 'factory_bot'


RSpec.describe Api::V1::UsersController, type: :controller do
  context '.index' do

    it 'should return a successful response' do
      admin_user = create :admin_user, email: 'admin@user.com', password: '111111A'

      sign_in( admin_user )
      get :index
      expect(response).to be_successful# expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'create a new user' do
      admin_user = create :admin_user, email: 'admin@user.com', password: '111111A'

      valid_user_params = {
        user: {
          name: 'test',
          last_name: 'tester',
          age: '26',
          gender: 'men',
          tel: '0918',
          image: nil,
          background_image: nil,
          email: 'test@test.com',
          password: '111111@A',
          role: nil
        }
      }

      sign_in( admin_user )
      expect { post :create, params: valid_user_params }.to change(User, :count).by(1)
    end
  end

  describe 'GET users#show' do
    it 'it return a successful 200 response' do
      customer_user = create :customer_user, email: 'user@gmail.com', password: '111111A'

      sign_in( customer_user )
      get :show, params: { id: customer_user.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT users#updata' do
    it 'change attribute of admin_user' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'

      valid_user_params = {
        id: admin_user.id,
        user:{
          name: 'new name',
          last_name: 'new last name',
          age: '27',
          gender: 'men',
          tel: '111',
          image: nil,
          background_image: nil,
          email: 'test11@test.com',
          password: '111111',
          role: 'admin'
        }
      }

      sign_in( admin_user)
      put :update, params: valid_user_params
      admin_user.reload
      expect(admin_user.last_name).to eq('new last name')
    end
  end

  describe 'GET #destroy' do
    it 'should destroy the item' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'
      count = User.count

      sign_in( admin_user )
      delete :destroy, params: { id: admin_user.id }
      expect(User.count).to eq(count - 1)
    end
  end
end

