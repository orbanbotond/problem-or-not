class Comment < ActiveRecord::Base
  belongs_to :problem
  attr_accessible :oppinion, :user_id
end
