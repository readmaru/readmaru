require "rails_helper"

RSpec.describe SignOutPolicy do
  subject { described_class }

  context "for visitor" do
    let(:user) { nil }
    let(:context) { UserContext.new(user) }

    permissions :destroy? do
      it "denies access" do
        expect(subject).to_not permit(context)
      end
    end
  end

  context "for user" do
    let(:user) { create(:user) }
    let(:context) { UserContext.new(user) }

    permissions :destroy? do
      it "grants access" do
        expect(subject).to permit(context)
      end
    end
  end
end