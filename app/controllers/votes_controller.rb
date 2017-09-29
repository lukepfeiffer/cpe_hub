class VotesController < ApplicationController
  def upvote
    if params[:object] == "discussion"
      object = Discussion.find(params[:disc_id])
    end

    get_vote(object)
    if @vote.value < 1
      @vote.value = 1
      if @vote.save
        head :ok
      end
    else
      head :no_content
    end
  end

  def downvote
    if params[:object] == "discussion"
      object = Discussion.find(params[:disc_id])
    end

    get_vote(object)
    if @vote.value > -1
      @vote.value = -1
      if @vote.save
        head :ok
      end
    else
      head :no_content
    end
  end

  private
  def get_vote(object)
    @vote = object.votes.find_by_user_id(current_user.id)
    unless @vote
      @vote = Vote.create(:user_id => current_user.id, :value => 0)
      object.votes << @vote
    end
  end
end
