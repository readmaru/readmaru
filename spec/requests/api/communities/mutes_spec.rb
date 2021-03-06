require "rails_helper"

RSpec.describe Api::Communities::MutesController, context: :as_moderator_user do
  describe ".index" do
    it "returns paginated mutes sorted by desc" do
      community = context.community
      first_mute = create(:mute, source: community)
      second_mute = create(:mute, source: community)
      third_mute = create(:mute, source: community)

      get "/api/communities/#{community.to_param}/mutes.json?after=#{third_mute.to_param}"

      expect(response).to have_http_status(200)
      expect(response).to have_sorted_json_collection(second_mute, first_mute)
      expect(response).to match_json_schema("controllers/api/communities/mutes_controller/index/200")
    end
  end

  describe ".show" do
    it "returns mute" do
      community = context.community
      mute = create(:mute, source: community)

      get "/api/communities/#{community.to_param}/mutes/#{mute.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/communities/mutes_controller/show/200")
    end
  end

  describe ".create" do
    context "with valid params" do
      it "creates mute" do
        community = context.community
        user = create(:user)
        params = {
          user_id: user.id,
          end_at: Time.current.tomorrow
        }

        post "/api/communities/#{community.to_param}/mutes.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/communities/mutes_controller/create/200")
      end
    end

    context "with invalid params" do
      it "return errors" do
        community = context.community
        params = {
          user_id: "",
          end_at: ""
        }

        post "/api/communities/#{community.to_param}/mutes.json", params: params

        expect(response).to have_http_status(422)
        expect(response).to match_json_schema("controllers/api/communities/mutes_controller/create/422")
      end
    end
  end

  describe ".update" do
    context "with valid params" do
      it "updates mute" do
        community = context.community
        mute = create(:mute, source: community)
        params = {
          end_at: Time.current.tomorrow
        }

        put "/api/communities/#{community.to_param}/mutes/#{mute.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/communities/mutes_controller/update/200")
      end
    end

    context "with invalid params" do
      it "does not update mute and return errors" do
        community = context.community
        mute = create(:mute, source: community)
        params = {
          end_at: ""
        }

        put "/api/communities/#{community.to_param}/mutes/#{mute.to_param}.json", params: params

        expect(response).to have_http_status(422)
        expect(response).to match_json_schema("controllers/api/communities/mutes_controller/update/422")
      end
    end
  end

  describe ".destroy" do
    it "deletes mute" do
      community = context.community
      mute = create(:mute, source: community)

      delete "/api/communities/#{community.to_param}/mutes/#{mute.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
