# frozen_string_literal: true

class ReportPolicy < ApplicationPolicy
  def posts?
    moderator?
  end

  alias comments? posts?

  def show?
    moderator?
  end

  def create?
    user?
  end

  alias new? create?

  def permitted_attributes_for_create
    [:text]
  end
end
