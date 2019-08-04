# frozen_string_literal: true

class DeletionReasonsFacade < ApplicationFacade
  def index_meta_title
    sub_context? ? "#{sub.title}: #{I18n.t("deletion_reasons")}" : I18n.t("deletion_reasons")
  end

  def pagination_permitted_params
    [:sub]
  end
end