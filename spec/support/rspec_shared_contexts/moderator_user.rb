RSpec.shared_context "as moderator user" do
  before(:each, type: :request) do
    login_as(context.user)
  end

  let(:context) do
    user = create(:user)
    community = create(:community_with_user_moderator, user: user)

    Context.new(user, community)
  end
end

RSpec.configure do |config|
  config.include_context "as moderator user", context: :as_moderator_user
end
