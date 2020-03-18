class Api::V1::SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_skill, only: [:show, :update, :destroy]
  # GET /skills
  def index
    authorize(Skill)
    skills = policy_scope(Skill).all
    render jsonapi: skills
  end

  # GET /skill
  def show
    render jsonapi: @skill
  end

  # POST /skill
  def create
    authorize(Skill)
    skill = Skill.new(skill_params)
    skill.user_id = current_user.id

    if skill.save
      render jsonapi: skill, status: :created
    else
      render json: skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skill
  def update
    if @skill.update(skill_params)
      render jsonapi: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skill
  def destroy
    @skill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = policy_scope(Skill).find(params[:id])
      authorize(@skill)
    end

    # Only allow a trusted parameter “white list” through.
    def skill_params
      params.require(:skill).permit(:skill_title, :skill_level)
    end
  end
