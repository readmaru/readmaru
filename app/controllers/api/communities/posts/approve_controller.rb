class Api::Communities::Posts::ApproveController < ApplicationController
  before_action :set_community
  before_action :set_post
  before_action -> { authorize(Api::Communities::Posts::ApprovePolicy, @post) }

  def update
    Communities::ApprovePost.new(post: @post, user: current_user).call

    render json: PostSerializer.serialize(@post)
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
