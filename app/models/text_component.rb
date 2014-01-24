class TextComponent < ActiveRecord::Base
  include Highlighter

  belongs_to :problem

  def description_highlighted(search_term)
    highlight( description, search_term || '')
  end

  def description_markdown(search_term = '')
    BlueCloth.new(description_highlighted(search_term)).to_html.html_safe
  end

end
