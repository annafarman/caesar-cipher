def caesar_cipher(sentence, shift_factor)
    lowercase_alphabets = ('a'..'z').to_a
    uppercase_alphabets = ('A'..'Z').to_a

    alphabets_arr_length = lowercase_alphabets.length
    #p alphabets_arr_length

    sentence_array = sentence.chars
    #p sentence_array
    shifted_char = []
    ciphered_array = []

    sentence_array.each do |letter|
        if lowercase_alphabets.any?(letter) 
            placeholder_index = lowercase_alphabets.find_index(letter) + shift_factor
            (placeholder_index < alphabets_arr_length)?  shifted_char << placeholder_index : shifted_char << (placeholder_index%alphabets_arr_length)  
            #p "lower"
        elsif uppercase_alphabets.any?(letter)
            placeholder_index = uppercase_alphabets.find_index(letter) + shift_factor
            if (placeholder_index < alphabets_arr_length) 
                 shifted_char << [placeholder_index, 0] 
            else shifted_char << [(placeholder_index%alphabets_arr_length), 0]
            end
            #p "upper"
        else
            shifted_char << letter
            #p "#{letter} is a String? #{letter.kind_of?(String)}"
        end
    end
    #p shifted_char

    shifted_char.each do |index|
        if index.kind_of?(String)   
            ciphered_array << index
        elsif index.kind_of?(Array)
            ciphered_array << uppercase_alphabets[index[0]]  
        else
            ciphered_array << lowercase_alphabets[index]
        end
    end
    #p ciphered_array
    p ciphered_array.join
end

caesar_cipher("What a string!", 5) 
caesar_cipher("Hello World", 3)
caesar_cipher("Hello, World!", 5)
caesar_cipher("The quick brown fox jumps over the lazy dog.", 7)