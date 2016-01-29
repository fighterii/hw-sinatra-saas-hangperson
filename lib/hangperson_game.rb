class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  def word_with_guesses
     @word.gsub(/./){|x| guesses.include?(x) ? x : '-'}
  end
  
  def check_win_or_lose
    @word.each_char{|x| 
    #debugger
    if !@guesses.include?(x) then
      if @wrong_guesses.length >= 7 then
        return :lose
      else
        return :play
      end
    end
    }
    return :win
  end
  
  def guess(character)
    if character == '' then
      raise(ArgumentError)
    end
    if character == nil then
      raise(ArgumentError)
    end
    #debugger
    if character =~ /[^a-zA-Z]/ then
      raise(ArgumentError)
    end
    character.downcase!
    if @guesses.include?(character) || @wrong_guesses.include?(character) then
      return false
    else
      contains_char = @word.include?(character)
      if contains_char then
        @guesses << character
      else
        @wrong_guesses << character
      end
      return true
    end

  
  end

end
