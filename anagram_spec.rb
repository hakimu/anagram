# Given a word and a list of possible anagrams, select the correct sublist.

# Given "listen" and a list of candidates like 
# "enlists" "google" "inlets" "banana" the program should return a 
# list containing "inlets".

require_relative 'anagram'

describe Anagram do
  let(:anagram) { 'listen' }
  let(:word_list) { ['enlists', 'google', 'inlets', 'banana'] }
  subject { Anagram.new(anagram, word_list) }
  describe '#call' do
    it 'finds the anagram' do
      expect(subject.call).to eq(['inlets'])
    end
    it 'is able to return multiple anagrams' do
      anagram = Anagram.new('earthling', ['foo', 'bar', 'haltering', 'lathering'])
      expect(anagram.call).to eq(['haltering', 'lathering'])
    end
    it 'returns an empty array if there\'s no match' do
      anagram = Anagram.new('star', ['one', 'two', 'three'])
      expect(anagram.call).to eq([])
    end
  end
  describe '#breakdown_word' do
    it 'breaks down the word' do
      expect(subject.send(:breakdown_word)).to eq('eilnst')
    end
  end
  describe '#compare_word_with_list' do
    it 'compares the anagram with the list of words' do
      expect(subject.send(:compare_word_with_list)).to eq(['inlets'])
    end
  end
end
