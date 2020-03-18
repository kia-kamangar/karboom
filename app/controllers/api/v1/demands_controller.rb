class Api::V1::DemandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_demand, only: [:show, :update, :destroy]

  # GET /demands
  def index
    authorize(Demand)
    demands = policy_scope(Demand).all
    render jsonapi: demands
  end

  # GET /demand
  def show
    render jsonapi: @demand
  end

  # POST /demand
  def create
    authorize(Demand)
    demand = Demand.new(demand_params)
    demand.user_id = current_user.id
    # demand.demand_id =

    if demand.save
      render jsonapi: demand, status: :created
    else
      render json: demand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /demand
  def update
    if @demand.update(demand_params)
      render jsonapi: @demand
    else
      render json: @demand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /demand
  def destroy
    @demand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = policy_scope(Demand).find(params[:id])
      authorize(@demand)
    end

    # Only allow a trusted parameter “white list” through.
    def demand_params
      params.require(:demand).permit(:job_title, :job_description, :salary)
    end
  end
