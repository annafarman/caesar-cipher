def caesar_cipher(sentence, shift_factor)
  lowercase_alphabets = ('a'..'z').to_a
  uppercase_alphabets = ('A'..'Z').to_a

  alphabets_arr_length = lowercase_alphabets.length
  # p alphabets_arr_length

  sentence_array = sentence.chars
  # p sentence_array
  shifted_char = []
  ciphered_array = []

  sentence_array.each do |letter|
    if lowercase_alphabets.any?(letter)
      placeholder_index = lowercase_alphabets.find_index(letter) + shift_factor
      placeholder_index < alphabets_arr_length ? shifted_char << placeholder_index : shifted_char << (placeholder_index % alphabets_arr_length)
    # p "lower"
    elsif uppercase_alphabets.any?(letter)
      placeholder_index = uppercase_alphabets.find_index(letter) + shift_factor
      shifted_char << if placeholder_index < alphabets_arr_length
                        [placeholder_index, 0]
                      else
                        [(placeholder_index % alphabets_arr_length), 0]
                      end
    # p "upper"
    else
      shifted_char << letter
      # p "#{letter} is a String? #{letter.kind_of?(String)}"
    end
  end
  # p shifted_char

  shifted_char.each do |index|
    ciphered_array << if index.is_a?(String)
                        index
                      elsif index.is_a?(Array)
                        uppercase_alphabets[index[0]]
                      else
                        lowercase_alphabets[index]
                      end
  end
  # p ciphered_array
  p ciphered_array.join
end

caesar_cipher('What a string!', 5)
caesar_cipher('Hello World', 3)
caesar_cipher('Hello, World!', 5)
caesar_cipher('The quick brown fox jumps over the lazy dog.', 7)
