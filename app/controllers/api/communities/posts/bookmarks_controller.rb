class Api::Communities::Posts::BookmarksController < ApplicationController
  before_action :set_community
  before_action :set_post
  before_action -> { authorize(Api::Communities::Posts::BookmarksPolicy, @post) }

  def create
    Communities::Posts::CreateBookmark.new(post: @post, user: current_user).call

    head :no_content
  end

  def destroy
    Communities::Posts::DeleteBookmark.new(post: @post, user: current_user).call

    head :no_content
  end

  private

  def set_community
    @community = CommunitiesQuery.new.with_url(params[:community_id]).take!
  end

  def set_post
    @post = @community.posts.find(params[:post_id])
  end

  def pundit_user
    Context.new(current_user, @community)
  end
end
