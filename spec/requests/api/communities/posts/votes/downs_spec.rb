require "rails_helper"

RSpec.describe Api::Communities::Posts::Votes::DownsController, context: :as_signed_in_user do
  describe ".create" do
    it "creates down vote on post" do
      community = create(:community)
      post = create(:post, community: community)

      post "/api/communities/#{community.to_param}/posts/#{post.to_param}/votes/downs.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/communities/posts/votes/downs_controller/create/200")
    end
  end

  describe ".destroy" do
    it "deletes down vote on post" do
      community = create(:community)
      post = create(:post, community: community)

      delete "/api/communities/#{community.to_param}/posts/#{post.to_param}/votes/downs.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/communities/posts/votes/downs_controller/destroy/200")
    end
  end
end
