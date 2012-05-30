class Problem < ActiveRecord::Base
  belongs_to :user
  has_paper_trail

  def description_markdown
    BlueCloth.new(read_attribute(:description)).to_html.html_safe
  end
end
