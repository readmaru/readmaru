class Communities::Posts::CreateUpVote
  include ActiveModel::Model

  attr_accessor :post, :user

  def call
    return previous_vote if user_have_same_opinion?

    ActiveRecord::Base.transaction do
      if user_changed_opinion?
        previous_vote.destroy!
      end

      vote = post.votes.create!(user: user, vote_type: :up)

      if user_changed_opinion?
        Post.update_counters(post.id, {up_votes_count: 1, down_votes_count: -1})
      else
        post.increment!(:up_votes_count)
      end

      post.reload.update_scores!

      vote
    end
  end

  private

  def previous_vote
    @_previous_vote ||= post.votes.where(user: user).take
  end

  def user_have_same_opinion?
    previous_vote.present? && previous_vote.up?
  end

  def user_changed_opinion?
    previous_vote.present? && previous_vote.down?
  end
end
