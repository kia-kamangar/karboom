class Api::V1::ResumesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_resume, only: [:show, :update, :destroy]
  # GET /resume
  def index
    authorize(Resume)
    resumes = policy_scope(Resume).all
    render jsonapi: resumes
  end

  # GET /resume
  def show
    render jsonapi: @resume
  end

  # POST /resume
  def create
    authorize(Resume)
    resume = Resume.new(resume_params)
    resume.user_id = current_user.id

    if resume.save
      render jsonapi: resume, status: :created
    else
      render json: resume.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resume
  def update
    if @resume.update(resume_params)
      render jsonapi: @resume
    else
      render json: @resume.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resume
  def destroy
    @resume.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = policy_scope(Resume).find(params[:id])
      authorize(@resume)
    end

    # Only allow a trusted parameter “white list” through.
    def resume_params
      params.require(:resume).permit(:resume_title, :start_date, :end_date)
    end
end
