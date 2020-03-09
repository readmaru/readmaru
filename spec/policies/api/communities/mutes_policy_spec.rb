require "rails_helper"

RSpec.describe Api::Communities::MutesPolicy do
  subject { described_class }

  context "as signed out user", context: :as_signed_out_user do
    let(:mute) { create(:mute) }

    permissions :index? do
      it { is_expected.to permit(context) }
    end

    permissions :create? do
      it { is_expected.to_not permit(context) }
    end

    permissions :update?, :destroy? do
      it { is_expected.to_not permit(context, mute) }
    end
  end

  context "as signed in user", context: :as_signed_in_user do
    let(:mute) { create(:mute) }

    permissions :index? do
      it { is_expected.to permit(context) }
    end

    permissions :create? do
      it { is_expected.to_not permit(context) }
    end

    permissions :update?, :destroy? do
      it { is_expected.to_not permit(context, mute) }
    end
  end

  context "as moderator user", context: :as_moderator_user do
    let(:mute) { create(:mute, community: context.community) }

    permissions :index?, :create? do
      it { is_expected.to permit(context) }
    end

    permissions :update?, :destroy? do
      it { is_expected.to permit(context, mute) }
    end
  end

  context "as muted user", context: :as_muted_user do
    let(:mute) { create(:mute, community: context.community) }

    permissions :index? do
      it { is_expected.to permit(context) }
    end

    permissions :create? do
      it { is_expected.to_not permit(context) }
    end

    permissions :update?, :destroy? do
      it { is_expected.to_not permit(context, mute) }
    end
  end

  context "as banned user", context: :as_banned_user do
    let(:mute) { create(:mute, community: context.community) }

    permissions :index?, :create? do
      it { is_expected.to_not permit(context) }
    end

    permissions :update?, :destroy? do
      it { is_expected.to_not permit(context, mute) }
    end
  end

  describe ".permitted_attributes_for_create" do
    it "contains attributes" do
      policy = described_class.new(Context.new(nil, nil))

      expect(policy.permitted_attributes_for_create).to contain_exactly(:username, :reason, :days, :permanent)
    end
  end

  describe ".permitted_attributes_for_update" do
    it "contains attributes" do
      policy = described_class.new(Context.new(nil, nil))

      expect(policy.permitted_attributes_for_update).to contain_exactly(:reason, :days, :permanent)
    end
  end
end