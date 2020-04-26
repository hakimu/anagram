class Anagram
  def initialize(word, list_of_words)
    @word = word
    @list_of_words = list_of_words
  end

  def call
    compare_word_with_list
  end

  private 

  attr_accessor :word, :list_of_words

  def breakdown_word
    word.split('').sort.join
  end

  def compare_word_with_list
    anagram = []
    list_of_words.each do |words|
      if breakdown_word == words.split('').sort.join
        anagram << words
      end
    end
    anagram
  end
end
