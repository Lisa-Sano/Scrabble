class Scoring
  LETTER_SCORES = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def self.score(word)
    word_score = 0
    word = word.upcase
    letter_array = word.split(//)
    return letter_array
    # letter_array.each do |letter|
    #   LETTER_SCORES.each do |key, value|
    #     if value.include? letter
    #       word_score += key
    #     end
    #   end
    # end

    # word_score
  end

end