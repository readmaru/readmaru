# frozen_string_literal: true

class BlacklistedDomainsController < ApplicationController
  before_action :set_sub, only: [:index, :search, :new, :create]
  before_action :set_blacklisted_domain, only: [:destroy]
  before_action -> { authorize(BlacklistedDomain) }, only: [:index, :search, :new, :create]

  def index
    @records = BlacklistedDomain.where(sub: @sub)
                   .reverse_chronologically(params[:after].present? ? BlacklistedDomain.find_by_id(params[:after]) : nil)
                   .limit(51)
                   .to_a

    if @records.size > 50
      @records.delete_at(-1)
      @after_record = @records.last
    end
  end

  def search
    @records = BlacklistedDomain.where(sub: @sub).search(params[:query]).all

    render "index"
  end

  def new
    @form = CreateBlacklistedDomain.new

    render partial: "new"
  end

  def create
    @form = CreateBlacklistedDomain.new(create_params)

    if @form.save
      head :no_content, location: blacklisted_domains_path(sub: @sub)
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    DeleteBlacklistedDomain.new(blacklisted_domain: @blacklisted_domain, current_user: current_user).call

    head :no_content
  end

  private

  def pundit_user
    UserContext.new(current_user, @sub || @blacklisted_domain&.sub)
  end

  def set_sub
    @sub = params[:sub].present? ? Sub.where("lower(url) = ?", params[:sub].downcase).take! : nil
  end

  def set_blacklisted_domain
    @blacklisted_domain = BlacklistedDomain.find(params[:id])
  end

  def create_params
    params.require(:create_blacklisted_domain).permit(:domain).merge(sub: @sub, current_user: current_user)
  end
end
