class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end 

  def initialize
    @random_word = Hangman.random_word
    @secret_word = @random_word
    @guess_word = Array.new(@secret_word.split("").length, "_")
    @game_over = false
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    secret_word = @secret_word.split("")
    new_array = []
    secret_word.each_with_index do |letter,i|
      if letter == char
        new_array << i
      # else
      #   remaining_incorrect_guesses -= 1
      end
    end
    new_array
  end

  def fill_indices(char,indices)
    indices.each do |i|
      guess_word[i] = char
    end
    guess_word
  end
require "byebug"
  def try_guess(char)
    fill_indices(char, get_matching_indices(char))
    # debugger
   
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    else 
      @remaining_incorrect_guesses -= 1 if !(@secret_word.include?(char))
      attempted_chars << char
      return true
    end
    


  end

end