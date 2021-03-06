class Api::Communities::Posts::Comments::ReportsController < ApplicationController
  before_action :set_community
  before_action :set_post
  before_action :set_comment
  before_action :set_report, only: [:show, :destroy]
  before_action -> { authorize(Api::Communities::Posts::Comments::ReportsPolicy, @comment) }, only: [:index, :create]
  before_action -> { authorize(Api::Communities::Posts::Comments::ReportsPolicy, @report) }, only: [:show, :destroy]

  def index
    query = @comment.reports.includes(:user, :community, reportable: [post: :community])
    reports = paginate(
      query,
      attributes: [:id],
      order: :desc,
      limit: 25,
      after: params[:after].present? ? Report.where(id: params[:after]).take : nil
    )

    render json: ReportSerializer.serialize(reports)
  end

  def show
    render json: ReportSerializer.serialize(@report)
  end

  def create
    service = Communities::Posts::Comments::CreateReport.new(create_params)

    if service.call
      render json: ReportSerializer.serialize(service.report)
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Communities::Posts::Comments::DeleteReport.new(report: @report).call

    head :no_content
  end

  private

  def set_community
    @community = CommunitiesQuery.new.with_url(params[:community_id]).take!
  end

  def set_post
    @post = @community.posts.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:comment_id])
  end

  def set_report
    @report = @comment.reports.find(params[:id])
  end

  def create_params
    attributes = Api::Communities::Posts::Comments::ReportsPolicy.new(pundit_user, @comment).permitted_attributes_for_create
    params.permit(attributes).merge(comment: @comment, user: current_user)
  end

  def pundit_user
    Context.new(current_user, @community)
  end
end
