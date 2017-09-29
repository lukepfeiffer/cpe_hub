class Discussion < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  has_many :votes

  def vote_count
    vote_values = votes.pluck(:value)
    vote_count = vote_values.sum
    vote_count < 0 ? 0 : vote_count
  end
end
