class Discussion < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :votes
  has_many :comments

  def vote_count
    vote_values = votes.pluck(:value)
    vote_count = vote_values.sum
    vote_count < 0 ? 0 : vote_count
  end

  def comments_count
  end
end
