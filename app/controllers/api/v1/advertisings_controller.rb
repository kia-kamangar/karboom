class Api::V1::AdvertisingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_advertising, only: [:show, :update, :destroy]
  # GET /advertisings
  def index
    authorize(Advertising)
    advertisings = policy_scope(Advertising).all
    render jsonapi: advertisings
  end

  # GET /advertisings/1
  def show
    render jsonapi: @advertising
  end

  # POST /advertisings
  def create
    authorize(Advertising)
    advertising = Advertising.new(advertising_params)
    advertising.company_id = current_user.company.id

    if advertising.save
      render jsonapi: advertising, status: :created
    else
      render json: advertising.errors, status: :unprocessable_entity
   end
  end

  # PATCH/PUT /advertisings/1
  def update
    if @advertising.update(advertising_params)
      render jsonapi: @advertising
    else
      render json: @advertising.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advertisings/1
  def destroy
    @advertising.destroy
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertising
      @advertising = policy_scope(Advertising).find(params[:id])
      authorize(@advertising)
    end

    # Only allow a trusted parameter “white list” through.
    def advertising_params
      params.require(:advertising).permit(:job_title, :job_description, :salary)
    end
 end
