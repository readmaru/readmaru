require "rails_helper"

RSpec.describe Api::Users::Posts::Controversial::AllController, context: :as_signed_in_user do
  describe ".index" do
    it "returns paginated posts sorted by controversial score" do
      user = context.user
      first_post = create(:created_last_month_post, created_by: user, controversy_score: 3)
      second_post = create(:created_last_week_post, created_by: user, controversy_score: 2)
      third_post = create(:created_yesterday_post, created_by: user, controversy_score: 1)

      get "/api/users/#{user.to_param}/posts/controversial/all.json?after=#{first_post.to_param}"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/posts/controversial/all_controller/index/200")
      expect(response).to have_sorted_json_collection(second_post, third_post)
    end
  end
end
