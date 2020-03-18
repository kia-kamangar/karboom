[1mdiff --git a/spec/controllers/api/v1/resumes_controller_spec.rb b/spec/controllers/api/v1/resumes_controller_spec.rb[m
[1mindex 2a58787..b73c549 100644[m
[1m--- a/spec/controllers/api/v1/resumes_controller_spec.rb[m
[1m+++ b/spec/controllers/api/v1/resumes_controller_spec.rb[m
[36m@@ -1,5 +1,62 @@[m
[31m-# require 'rails_helper'[m
[32m+[m[32mrequire 'rails_helper'[m
 [m
[31m-# RSpec.describe ResumesController, type: :controller do[m
[32m+[m[32mRSpec.describe Api::V1::ResumesController, type: :controller do[m
[32m+[m[32m  describe 'GET resume#index' do[m
[32m+[m[32m    it 'should return successful response' do[m
[32m+[m[32m      resume = create :resume[m
[32m+[m[32m      get :index[m
 [m
[31m-# end[m
[32m+[m[32m      expect(response).to be_successful[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  describe 'POST resume#create' do[m
[32m+[m[32m    it 'should create a resume' do[m
[32m+[m[32m      resume = create :resume[m
[32m+[m[32m      valid_resume_params = {[m
[32m+[m[32m        resume: {[m
[32m+[m[32m          resume_title: 'test',[m
[32m+[m[32m          start_date: nil,[m
[32m+[m[32m          start_date: nil,[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m      expect{ post :create, params:valid_resume_params }.to change(Resume, :count).by(1)[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  describe 'GET resume#show' do[m
[32m+[m[32m    it 'should return 200 response' do[m
[32m+[m[32m      resume = create :resume[m
[32m+[m[32m      get :show, params: {id: resume.id}[m
[32m+[m
[32m+[m[32m      expect(response).to have_http_status(200)[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  describe 'PUT resume#update' do[m
[32m+[m[32m    it 'should change resume attributes' do[m
[32m+[m[32m      resume = create :resume[m
[32m+[m[32m      valid_resume_params = {[m
[32m+[m[32m        id: resume.id,[m
[32m+[m[32m        resume: {[m
[32m+[m[32m          resume_title: 'new test',[m
[32m+[m[32m          start_date: nil,[m
[32m+[m[32m          end_date: nil,[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m      put :update, params: valid_resume_params[m
[32m+[m[32m      resume.reload[m
[32m+[m[32m      expect(resume.resume_title).to eq('new test')[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  describe 'GET resume#destroy' do[m
[32m+[m[32m    it 'should destroy a resume' do[m
[32m+[m[32m      resume = create :resume[m
[32m+[m[32m      count = Resume.count[m
[32m+[m
[32m+[m[32m      delete :destroy, params: { id: resume.id }[m
[32m+[m[32m      expect(Resume.count).to eq( count - 1 )[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
