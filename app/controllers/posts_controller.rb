# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_sub, only: [:new, :create]
  before_action :set_post, only: [:edit, :update]
  before_action -> { authorize(@sub, policy_class: PostPolicy) }, only: [:new, :create]
  before_action -> { authorize(@post, policy_class: PostPolicy) }, only: [:edit, :update]

  def new
    @form = CreatePost.new
  end

  def edit
    @form = UpdatePost.new(text: @post.text)
  end

  def create
    @form = CreatePost.new(create_params)

    if @form.save
      head :no_content, location: thing_path(@form.post)
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def update
    @form = UpdatePost.new(update_params)

    if @form.save
      head :no_content, location: thing_path(@form.post)
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  private

  def set_sub
    @sub = params[:sub].present? ? Sub.where("lower(url) = ?", params[:sub].downcase).take! : Sub.default
  end

  def set_post
    @post = Thing.thing_type(:post).where(content_type: :text).find(params[:id])
  end

  def create_params
    params.require(:create_post).permit(:title, :text, :url, :file, :explicit, :spoiler).merge(sub: @sub, current_user: current_user)
  end

  def update_params
    params.require(:update_post).permit(:text).merge(post: @post)
  end
end
