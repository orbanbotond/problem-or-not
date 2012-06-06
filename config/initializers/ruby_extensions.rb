# encoding: utf-8

class String
    UNACCENT_HASH = {
		'A'		=> 'ÀÁÂÃÄÅĀĂǍẠẢẤẦẨẪẬẮẰẲẴẶǺĄ',
		'a'		=> 'àáâãäåāăǎạảấầẩẫậắằẳẵặǻą',
		'C'		=> 'ÇĆĈĊČ',
		'c'		=> 'çćĉċč',
		'D'		=> 'ÐĎĐ',
		'd'		=> 'ďđ',
		'E'		=> 'ÈÉÊËĒĔĖĘĚẸẺẼẾỀỂỄỆ',
		'e'		=> 'èéêëēĕėęěẹẻẽếềểễệ',
		'G'		=> 'ĜĞĠĢ',
		'g'		=> 'ĝğġģ',
		'H'		=> 'ĤĦ',
		'h'		=> 'ĥħ',
		'I'		=> 'ÌÍÎÏĨĪĬĮİǏỈỊ',
		'J'		=> 'Ĵ',
		'j'		=> 'ĵ',
		'K'		=> 'Ķ',
		'k'		=> 'ķ',
		'L'		=> 'ĹĻĽĿŁ',
		'l'		=> 'ĺļľŀł',
		'N'		=> 'ÑŃŅŇ',
		'n'		=> 'ñńņňŉ',
		'O'		=> 'ÒÓÔÕÖØŌŎŐƠǑǾỌỎỐỒỔỖỘỚỜỞỠỢ',
		'o'		=> 'òóôõöøōŏőơǒǿọỏốồổỗộớờởỡợð',
		'R'		=> 'ŔŖŘ',
		'r'		=> 'ŕŗř',
		'S'		=> 'ŚŜŞŠ',
		's'		=> 'śŝşš',
		'T'		=> 'ŢŤŦ',
		't'		=> 'ţťŧ',
		'U'		=> 'ÙÚÛÜŨŪŬŮŰŲƯǓǕǗǙǛỤỦỨỪỬỮỰ',
		'u'		=> 'ùúûüũūŭůűųưǔǖǘǚǜụủứừửữự',
		'W'		=> 'ŴẀẂẄ',
		'w'		=> 'ŵẁẃẅ',
		'Y'		=> 'ÝŶŸỲỸỶỴ',
		'y'		=> 'ýÿŷỹỵỷỳ',
		'Z'		=> 'ŹŻŽ',
		'z'		=> 'źżž',
		# Ligatures
		'AE'		=> 'Æ',
		'ae'		=> 'æ',
		'OE'		=> 'Œ',
		'oe'		=> 'œ'
  }
  def unaccent
    _str = self.clone
    UNACCENT_HASH.each do |k, v|
      _str.gsub!(/[#{v}]/, k)
    end
    _str
  end
  
  # old unaccent method (without regexp)
  # Note that in Ruby 1.9 the "index" method is "key"
  #
  def self.unaccent(str)
    new_chars = []
    str.each_char do |cstr|
      replaced = false
      ACCENTS.values.each do |accent_string|
        if accent_string.include?(cstr.to_s)
          new_chars << ACCENTS.index(accent_string)
          replaced = true
        end
      end
      new_chars << cstr unless replaced
    end
    new_chars.to_s
  end
end