class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action -> { authorize(Api::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::UsersPolicy, @user) }, only: [:show]
  before_action -> { authorize(Api::UsersPolicy) }, only: [:update]

  def index
    query = User
    users = paginate(
      query,
      attributes: [:username],
      order: :desc,
      limit: 25,
      after: params[:after].present? ? UsersQuery.new.with_username(params[:after]).take! : nil
    )

    render json: UserSerializer.serialize(users)
  end

  def show
    render json: UserSerializer.serialize(@user)
  end

  def update
    service = UpdateUser.new(update_params)

    if service.call
      render json: UserSerializer.serialize(service.user)
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = UsersQuery.new.with_username(params[:id]).take!
  end

  def update_params
    attributes = Api::UsersPolicy.new(pundit_user, current_user).permitted_attributes_for_update

    params.permit(attributes).merge(user: current_user)
  end

  def pundit_user
    Context.new(current_user, nil)
  end
end
