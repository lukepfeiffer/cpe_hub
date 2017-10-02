class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :discussion
  has_many :comments
end
