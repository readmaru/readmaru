class Api::Communities::Posts::Top::WeekController < ApplicationController
  before_action :set_community
  before_action -> { authorize(Api::Communities::Posts::Top::WeekPolicy) }

  def index
    query = PostsQuery.new(@community.posts).not_removed
    query = PostsQuery.new(query).for_the_last_week
    query = query.includes(:community, :created_by, :edited_by, :approved_by)
    posts = paginate(
      query,
      attributes: [:top_score, :id],
      order: :desc,
      limit: 25,
      after: params[:after].present? ? Post.where(id: params[:after]).take : nil
    )

    render json: PostSerializer.serialize(posts)
  end

  private

  def set_community
    @community = CommunitiesQuery.new.with_url(params[:community_id]).take!
  end

  def pundit_user
    Context.new(current_user, @community)
  end
end
