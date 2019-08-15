# frozen_string_literal: true

class HomeController < ApplicationController
  before_action -> { authorize(:home) }
  before_action :set_facade

  def index
    @records, @pagination = Post.not_removed
                                       .in_date_range(date)
                                       .includes(:community, :user)
                                       .paginate(attributes: ["#{sort}_score", :id], after: params[:after])

    @records = @records.map(&:decorate)
  end

  private

  def context
    Context.new(current_user, CommunitiesQuery.new.default.take!)
  end

  def query
    query = PostsQuery.new.not_removed
    query.new(query).search_created_after(date).includes(:community, :user)
  end

  def set_facade
    @facade = HomeFacade.new(context)
  end

  def sort
    ThingsSorting.new(params[:sort]).key
  end

  def date
    ThingsDates.new(params[:date]).date
  end
end
