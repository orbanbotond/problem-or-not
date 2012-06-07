module Highlighter
  def highlight(orig, search_string)
    return orig if search_string.strip.empty?

    string_unaccented = orig.unaccent
    r = Regexp.new "(#{search_string.unaccent.split.join('|')})", true
    search_array = string_unaccented.to_enum(:scan, r).map do |x,|
      [$`.size, $`.size + x.size - 1]
    end

    accented_search_string = []
    search_array.each do |a|
      accented_search_string << orig[a[0]..a[1]]
    end

    r = Regexp.new "(#{accented_search_string.join('|')})", true
    orig.gsub( r) {|match| "__*#{$&}*__"}
  end
end
