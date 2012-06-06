module Highlighter
  def highlight(orig, search_string)
    return orig if search_string.strip.empty?
    r = Regexp.new "(#{search_string.split.join('|')})", true
    orig.gsub( r) {|match| "__*#{$&}*__"}
  end
end
