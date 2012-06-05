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
  belongs_to :user
  has_many :comments

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

  class <<self
    def text_search(query)
      where('title @@ :q OR description @@ :q', q: query)
    end
  end

  has_paper_trail

  def description_markdown
    BlueCloth.new(read_attribute(:description)).to_html.html_safe
  end
end
