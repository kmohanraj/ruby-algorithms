class PhoneToWords
  @@number_map = {
    2 => %w(a b c),
    3 => %w(d e f),
    4 => %w(g h i),
    5 => %w(j k l),
    6 => %w(m n o),
    7 => %w(p q r s),
    8 => %w(t u v),
    9 => %w(w x y z)
  }

  @@dictionary = File.readlines('dictionary.txt').map{|word| word.strip}
  def self.word_exists(word)
    word_to_upcase = word.upcase!
    check_word = @@dictionary.bsearch{|x| x >= word_to_upcase }
    check_word == word_to_upcase
  end

  def self.convert_number_to_word(phone)
    combinations = nil
    phone.each_char do |num_char|
      codes = @@number_map[num_char.to_i]
      raise "Invalid symbol '#{num_char}' in the phone" if codes.nil?
      if combinations
        combinations = combinations.product(codes)
      else
        combinations = codes
      end
    end
    test_words = combinations.map { |e| e.flatten().join}
    test_words.select! { |w| word_exists(w) }
    test_words
  end

  def self.number_to_words(phone)
    last = phone.dup
    first = ''
    full_phone_words = convert_number_to_word(phone)
    match_words = full_phone_words
    while last.length > 3 do
      first += last.slice!(0)
      next if first.length < 3
      first_words = convert_number_to_word(first)
      last_words = convert_number_to_word(last)

      if first_words.length > 0 && last_words.length > 0 
        combinations = first_words.product(last_words)
        match_words += combinations
      end
      match_words.select!{|e| !full_phone_words.include?(e[0] + e[1]) }
    end
    match_words
  end
end
p PhoneToWords.number_to_words("6686787825")
