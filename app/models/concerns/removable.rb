# frozen_string_literal: true

module Removable
  extend ActiveSupport::Concern

  included do
    belongs_to :deleted_by, class_name: "User", foreign_key: "deleted_by_id", optional: true

    strip_attributes :deletion_reason, squish: true

    before_update :undo_approve, if: ->(r) { r.respond_to?(:approvable?) && r.removing? }

    validates :deletion_reason, allow_blank: true, length: { maximum: 5_000 }

    def remove!(user, reason = nil)
      remove(user, reason)
      save!
    end

    def remove(user, reason = nil)
      assign_attributes(
        deleted_by: user,
        deleted_at: Time.current,
        deletion_reason: reason
      )
    end

    def undo_remove
      assign_attributes(
        deleted_by: nil,
        deleted_at: nil,
        deletion_reason: nil
      )
    end

    def removable?
      true
    end

    def removing?
      deleted_at_changed? && removed?
    end

    def removed?
      deleted_at.present?
    end
  end
end