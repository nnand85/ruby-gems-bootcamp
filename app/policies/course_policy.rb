class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def owner?
    @record.user == @user.id
  end
  
  def edit?
    @user&.has_role?(:admin) || @record.user == @user.id
  end
  
  def update?
    @user&.has_role?(:admin) || @record.user == @user.id
  end
  
  def new?
    @user&.has_any_role? :teacher, :admin
  end
  
  def create?
    @user&.has_any_role? :teacher, :admin
  end
  
  def destroy?
    @user&.has_role?(:admin) || @record.user == @user.id
  end
end
