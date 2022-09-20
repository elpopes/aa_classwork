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

    def secret_word
      @random_word
    end




end
