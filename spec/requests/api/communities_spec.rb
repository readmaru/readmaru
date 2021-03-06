require "rails_helper"

RSpec.describe Api::CommunitiesController do
  describe ".index", context: :as_signed_out_user do
    it "returns paginated communities sorted by desc" do
      first_community = create(:community)
      second_community = create(:community)
      third_community = create(:community)

      get "/api/communities.json?after=#{third_community.to_param}"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/communities_controller/index/200")
      expect(response).to have_sorted_json_collection(second_community, first_community)
    end
  end

  describe ".show", context: :as_signed_out_user do
    it "returns community" do
      community = create(:community)

      get "/api/communities/#{community.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/communities_controller/show/200")
    end
  end

  describe ".create", context: :as_moderator_user do
    context "with valid params" do
      it "creates community and returns community" do
        post "/api/communities.json", params: {url: "Url", title: "Title", description: "Description"}

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/communities_controller/create/200")
      end
    end

    context "with invalid params" do
      it "returns error messages" do
        post "/api/communities.json", params: {url: "", title: "", description: ""}

        expect(response).to have_http_status(422)
        expect(response).to match_json_schema("controllers/api/communities_controller/create/422")
      end
    end
  end

  describe ".update", context: :as_moderator_user do
    context "with valid params" do
      it "updates community and returns community" do
        community = context.community

        put "/api/communities/#{community.to_param}.json", params: {title: "New title", description: "New description"}

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/communities_controller/update/200")
      end
    end

    context "with invalid params" do
      it "returns error messages" do
        community = context.community

        put "/api/communities/#{community.to_param}.json", params: {title: "", description: ""}

        expect(response).to have_http_status(422)
        expect(response).to match_json_schema("controllers/api/communities_controller/update/422")
      end
    end
  end
end
