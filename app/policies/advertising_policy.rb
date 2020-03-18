class AdvertisingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.where(company_id: user.company.id)
      else
        scope.all
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
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end