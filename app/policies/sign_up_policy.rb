# frozen_string_literal: true

class SignUpPolicy < ApplicationPolicy
  def create?
    visitor?
  end

  alias new? create?

  def permitted_attributes_for_create
    [:username, :email, :password]
  end
end