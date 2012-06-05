# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  oppinion   :text
#  problem_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Comment < ActiveRecord::Base

  include PgSearch
  multisearchable :against => [:oppinion]

  belongs_to :problem
  attr_accessible :oppinion, :user_id
end
