class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /@users
  def index
    authorize(User)
    users = User.all
    render jsonapi: users,
          include: %w(skills demands resumes company company.advertisings)
  end

  # GET /@users/1
  def show
    render jsonapi: @user,
           include: %w(skills demands resumes company company.advertisings)
  end

  # POST /@users
  def create
    authorize(User)
    user = User.new(user_params)
    # user.customer_id = current_user.id

    if user.save
      render jsonapi: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /@users/1
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render jsonapi: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /@users/1
  def destroy
   @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
     @user = User.find(params[:id])
     authorize(@user)
    end

    # Only allow a trusted parameter “white list” through.
    def user_params
      params.require(:user).permit(
        :name, :last_name, :age, :gender, :tel, :image, :email, :password, :role
      )
    end
  end


