require "rails_helper"

RSpec.describe Api::Users::Comments::Hot::WeekController, context: :as_signed_in_user do
  describe ".index" do
    it "returns paginated weekly comments sorted by hot score" do
      user = context.user
      _unrelated_comment = create(:created_last_week_comment, created_by: user)
      first_comment = create(:created_this_week_comment, created_by: user, hot_score: 3)
      second_comment = create(:created_this_week_comment, created_by: user, hot_score: 2)
      third_comment = create(:created_this_week_comment, created_by: user, hot_score: 1)

      get "/api/users/#{user.to_param}/comments/hot/week.json?after=#{first_comment.to_param}"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/comments/hot/week_controller/index/200")
      expect(response).to have_sorted_json_collection(second_comment, third_comment)
    end
  end
end
