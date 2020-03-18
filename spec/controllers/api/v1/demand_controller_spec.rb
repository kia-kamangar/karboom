require 'rails_helper'

RSpec.describe Api::V1::DemandsController, type: :controller do

  context '.index' do
    it 'should return successful response' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'

      sign_in( admin_user )
      get :index
      expect(response).to be_successful
    end
  end

  context 'POST demand#create' do
    it 'should create new demand and return 200 response' do
      admin_user = create :admin_user, email: 'admin@gmail.com', password: '111111A'

      demand_params = {
        demand: {
          job_title: 'test',
          job_description: 'test',
          salary: 123000,
        }
      }

      sign_in( admin_user )
      expect{ post :create, params: demand_params }.to change(Demand, :count).by(1)
    end
  end

  context 'GET demand#show' do
    it 'should return successful response' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      demand = create :demand, user_id: user.id

      sign_in( user )
      get :show, params: { id: demand.id }
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT demand#update' do
    it 'should change demand attributes' do
      user = create :admin_user, email: 'admin@gmail.com', password: '111111A'

      demand = create :demand, user_id: user.id
      demand_params = {
        id: demand.id,
        demand: {
          job_title: 'new test',
          job_description: 'new description test',
          salary: 50000,
        }
      }

      sign_in( user )
      put :update, params: demand_params
      demand.reload
      expect(demand.salary).to eq(50000)
    end
  end

  context 'GET demand#destroy' do
    it 'should destroy an demand' do
      user = create :customer_user, email: 'admin@gmail.com', password: '111111A'
      demand = create :demand, user_id: user.id

      count = Demand.count
      sign_in( user )
      delete :destroy, params: { id: demand.id }
      expect(Demand.count).to eq( count - 1 )
    end
  end
end