require 'rails_helper'
require 'factory_bot'

RSpec.describe Api::V1::SkillsController, type: :controller do
  describe 'GET skill#index' do
    it 'should return a successful response' do
      user = create :admin_user, email: 'admin@gmail.com', password: '111111A'

      sign_in( user )
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST skill#create' do
    it 'should create a skill' do
      user = create :customer_user, email: 'admin@gmail.com', password: '111111A'

      valid_skill_params = {
        skill: {
          skill_title: 'test',
          skill_level: 5,
        }
      }

      sign_in( user )
      expect { post :create, params: valid_skill_params }.to change(Skill, :count).by(1)
    end
  end

  describe 'GET skill#show' do
    it 'should return 200 response' do
      user = create :customer_user, email: 'admin@gmail.com', password: '123456A'
      skill = create :skill, user_id: user.id

      sign_in( user )
      get :show, params: { id: skill.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT skill#update' do
    it 'should change attribute of skill' do
      user = create :customer_user, email: 'admin@gmail.com', password: '111111A'
      skill = create :skill, user_id: user.id
      valid_skill_params = {
        id: skill.id,
        skill: {
          skill_title: 'new test',
          skill_level: 3
        }
      }

      sign_in( user )
      put :update, params: valid_skill_params
      skill.reload
      expect(skill.skill_title).to eq('new test')
    end
  end

  describe 'GET skill#destroy' do
    it 'should destroy the item' do
      user = create :customer_user, email: 'user@gmail.com', password: '111111A'
      skill = create :skill, user_id: user.id
      count = Skill.count

      sign_in( user )
      delete :destroy, params: { id: skill.id }
      expect(Skill.count).to eq(count - 1)
    end
  end
end