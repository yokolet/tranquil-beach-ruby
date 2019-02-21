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

  context CombinationSum do
    let(:obj) { CombinationSum.new }

    it 'find all combination sums for [2,3,6,7]' do
      candidates = [2,3,6,7]
      target = 7
      expected = [[7], [2,2,3]]
      expect(obj.combination_sum(candidates, target)).to match_array(expected)
    end

    it 'find all combination sums for [2,3,5]' do
      candidates = [2,3,5]
      target = 8
      expected = [
          [2,2,2,2],
          [2,3,3],
          [3,5]
      ]
      expect(obj.combination_sum(candidates, target)).to match_array(expected)
    end
  end
end