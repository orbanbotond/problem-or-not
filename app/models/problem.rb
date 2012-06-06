# == Schema Information
#
# Table name: problems
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  state       :string(255)     default("existing")
#

class Problem < ActiveRecord::Base

  include Highlighter
  
  def title_highlighted(search_term)
    highlight( title, search_term)
  end

  def description_highlighted(search_term)
    highlight( description.unaccent, search_term || '')
  end

  include PgSearch
  multisearchable :against => [:title, :description]

  belongs_to :user
  has_many :comments

  has_paper_trail

  scope :existing, where( :state => :existing)
  scope :resolved, where( :state => :resolved)

  state_machine :state, :initial => :existing do

    event :resolve do
      transition [:existing] => :resolved
    end

    event :reopen do
      transition [:resolved] => :existing
    end

  end

  def description_markdown(search_term = '')
    BlueCloth.new(description_highlighted(search_term)).to_html.html_safe
  end
end
