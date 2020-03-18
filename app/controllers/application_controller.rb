class ApplicationController < ActionController::Base
include Pundit
# before_action :authenticate_user!
protect_from_forgery prepend: true

before_action :verify_authenticity_token
	def app
  #   redirect_unless('admin') && return
		render 'layouts/application'
	end

private
  def authenticate_user!
    return super if user_signed_in?
    render json: { message: 'You are not logged in!'}
  end

  def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referer || root_path)
    end
end