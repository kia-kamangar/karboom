class Api::V1::CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_company, only: [:show, :update, :destroy]
  # GET /companies
  def index
    authorize(Company)
    companies = policy_scope(Company).all
    render jsonapi: companies,
           include: %w(advertisings)
  end

  # GET /companie
  def show
    render jsonapi: @company,
           include: %w(advertisings)
  end

  # POST /companies
  def create
    authorize(Company)
    company = Company.new(company_params)
    company.user_id = current_user.id

    if company.save
      render jsonapi: company, status: :created
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render jsonapi: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = policy_scope(Company).find(params[:id])
      authorize(@company)
    end

    # Only allow a trusted parameter “white list” through.
    def company_params
      params.require(:company).permit(:name, :about, :image, :background_image, :address, :tel)
    end
  end
