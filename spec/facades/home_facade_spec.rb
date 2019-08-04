require "rails_helper"

RSpec.describe HomeFacade do
  subject { described_class.new(context) }

  let(:user) { create(:user) }
  let(:context) { Context.new(user) }

  describe ".index_meta_title" do
    it "returns title" do
      expected_result = I18n.t("app_name")
      result = subject.index_meta_title

      expect(result).to eq(expected_result)
    end
  end
end