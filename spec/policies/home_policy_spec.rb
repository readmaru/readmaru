require "rails_helper"

RSpec.describe HomePolicy, type: :policy do
  subject { described_class }

  let(:community) { create(:community) }
  let(:context) { Context.new(user, community) }

  context "for visitor" do
    let(:user) { nil }

    permissions :index? do
      it { is_expected.to permit(context) }
    end
  end

  context "for user" do
    let(:user) { create(:user) }

    permissions :index? do
      it { is_expected.to permit(context) }
    end
  end
end