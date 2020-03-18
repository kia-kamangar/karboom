class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      # else
      #   scope.where(user_id: user.id)
      end
    end
  end

  def index?
    p '1111111111111111111'
    p user.admin?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end