class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def edit?
    @record.course.user_id == @user.id
  end
  
  def update?
    @record.course.user_id == @user.id
  end
  
  def show?
    @user&.has_role?(:teacher) || @record.course.user_id == @user.id
  end
  
  def new?
    # @user&.has_any_role? :teacher, :admin
  end
  
  def create?
    @record.course.user_id == @user.id
  end
  
  def destroy?
    @record.course.user_id == @user.id
  end
end
