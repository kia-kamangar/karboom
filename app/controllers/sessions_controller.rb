class SessionsController < Devise::SessionsController

  def create
    session['user_auth'] = params[:user]
    resource = warden.authenticate!(scope: resource_name, recall: 'sessions#failure')
    sign_in(resource_name, resource)

    message = I18n.t 'devise.sessions.signed_in'
    render jsonapi: current_user, status: 201,
           include: %w(skills demands resumes company company.advertisings)
  end

  def failure
    message = I18n.t 'devise.failure.invalid', authentication_keys: 'email'
    render json: { error: message }, status: 200
  end

  def respond_to_on_destroy
    message = I18n.t 'devise.sessions.signed_out'
    render json: { message: message }, status: :ok
  end
end
