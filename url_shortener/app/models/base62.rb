class Base62
  # https://en.wikipedia.org/wiki/Base62
  ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?

    result = ""
    while number > 0 do 
      number, idx = number.divmod(BASE)
      result.prepend ALPHABET[idx]
    end

    result
  end

  def self.decode(string)
    number = 0
    string.each_char do |c|
      if not ALPHABET.include?(c)
        return -1
      end
      number = number * BASE + ALPHABET.index(c)
    end
    return number
  end

end