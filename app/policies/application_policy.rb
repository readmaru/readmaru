class ApplicationPolicy
  attr_reader :user, :sub, :record

  def initialize(context, record)
    @user = context.user
    @sub = context.sub
    @record = record
  end

  private

  def user_signed_in?
    user.present?
  end

  def user_signed_out?
    !user_signed_in?
  end

  def user_moderator?
    sub_context? ? user.sub_moderator?(sub) : user.global_moderator?
  end

  def user_contributor?
    sub_context? ? user.sub_contributor?(sub) : user.global_contributor?
  end

  def user_banned?
    sub_context? ? user.banned_in_sub?(sub) : user.banned_globally?
  end

  def user_follower?
    sub_context? ? user.follower?(sub) : false
  end

  def sub_context?
    sub.present?
  end

  def global_context?
    !sub_context?
  end
end