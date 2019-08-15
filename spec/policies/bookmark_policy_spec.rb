require "rails_helper"

RSpec.describe BookmarkPolicy, type: :policy do
  subject { described_class }

  let(:community) { create(:community) }
  let(:context) { Context.new(user, community) }
  let(:bookmark) { create(:bookmark) }

  context "for visitor" do
    let(:user) { nil }

    permissions :posts?, :comments?, :create? do
      it { is_expected.to_not permit(context) }
    end

    permissions :destroy? do
      it { is_expected.to_not permit(context, bookmark) }
    end
  end

  context "for user" do
    let(:user) { create(:user) }

    permissions :posts?, :comments?, :create? do
      it { is_expected.to permit(context) }
    end

    permissions :destroy? do
      it { is_expected.to permit(context, bookmark) }
    end
  end
end