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

  self.per_page = 5

  include Highlighter

  include PgSearch
  multisearchable :against => [:oppinion]

  belongs_to :problem
  attr_accessible :oppinion, :user_id

  def oppinion_highlighted(search_term)
    highlight( oppinion, search_term || '')
  end

  def oppinion_markdown(search_term = '')
    BlueCloth.new(oppinion_highlighted(search_term)).to_html.html_safe
  end

end
