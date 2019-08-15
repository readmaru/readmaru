# frozen_string_literal: true

class ModeratorPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    moderator?
  end

  alias new? create?

  def destroy?
    moderator?
  end

  def permitted_attributes_for_create
    [:username]
  end
end
