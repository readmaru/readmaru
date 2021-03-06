class Communities::Posts::Comments::DeleteDownVote
  include ActiveModel::Model

  attr_accessor :comment, :user

  def call
    return false if vote.blank?

    ActiveRecord::Base.transaction do
      vote.destroy!
      comment.decrement!(:down_votes_count)
      comment.reload.update_scores!
    end
  end

  private

  def vote
    @_vote ||= comment.votes.where(user: user, vote_type: :down).take
  end
end
