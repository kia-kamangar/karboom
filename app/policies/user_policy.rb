class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index?
    user.admin? || user.customer?
  end

  def show?
    user.admin? || user.customer?
  end

  def create?
    true
  end

  def update?
    user.admin? || user.customer?
  end

  def destroy?
    user.admin?
  end
end