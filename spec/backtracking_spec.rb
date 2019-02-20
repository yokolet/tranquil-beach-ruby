require 'rspec'
Dir["./lib/backtracking/*.rb"].each {|file| require file }

describe 'Backtracking' do
  context LetterCombinations do
    let(:obj) { LetterCombinations.new }
    it 'creates all combinations of 23' do
      digits = "23"
      expected = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
      expect(obj.letter_combinations(digits)).to eq(expected)
    end
  end
end