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

  has_paper_trail

  def description_markdown
    BlueCloth.new(read_attribute(:description)).to_html.html_safe
  end
end
