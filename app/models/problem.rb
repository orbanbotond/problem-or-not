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
  extend FriendlyId
  include PgSearch
  multisearchable :against => [:title, :description]

  belongs_to :user
  has_many :comments, :order => 'updated_at DESC'

  has_paper_trail

  friendly_id :title, use: :slugged

  scope :existing, where( :state => :existing)
  scope :resolved, where( :state => :resolved)

  scope :sort_by_latest_update, order('updated_at DESC')

  include Highlighter
  
  def title_highlighted(search_term)
    highlight( title, search_term)
  end

  def description_highlighted(search_term)
    highlight( description, search_term || '')
  end
  
  def latest_comment
    comments.max_by { |comment| comment.updated_at }
  end

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
