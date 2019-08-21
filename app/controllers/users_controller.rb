# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:posts, :comments]
  before_action -> { authorize(@user) }

  def posts
    @records, @pagination = posts_query.paginate(after: params[:after])
    @records = @records.map(&:decorate)
  end

  def comments
    @records, @pagination = comments_query.paginate(after: params[:after])
    @records = @records.map(&:decorate)
  end

  def edit
    @user = current_user

    attributes = @user.slice(:email)

    @form = UpdateUserForm.new(attributes)
  end

  def update
    @form = UpdateUserForm.new(update_params)

    if @form.save
      head :no_content, location: edit_users_path
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = UsersQuery.new.with_username(params[:id]).take!
  end

  def posts_query
    PostsQuery.new(@user.posts).not_removed.includes(:community, :user)
  end

  def comments_query
    CommentsQuery.new(@user.comments).not_removed.includes(:community, :post, :user)
  end

  def update_params
    attributes = policy(@user).permitted_attributes_for_update

    params.require(:update_user_form).permit(attributes).merge(user: current_user)
  end
end
