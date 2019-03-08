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

  context Subsets do
    let(:obj) { Subsets.new }

    it 'returns power set of [1, 2, 3]' do
      nums = [1,2,3]
      expected =
          [
              [3],
              [1],
              [2],
              [1,2,3],
              [1,3],
              [2,3],
              [1,2],
              []
          ]
      expect(obj.subsets(nums).sort).to eq(expected.sort)
    end
  end

  context Permutations do
    let(:obj) { Permutations.new }

    it 'returns all permutations for [1, 2, 3]' do
      nums = [1, 2, 3]
      expected = [
          [1,2,3],
          [1,3,2],
          [2,1,3],
          [2,3,1],
          [3,1,2],
          [3,2,1]
      ]
      expect(obj.permute(nums)).to eq(expected)
    end
  end

  context PermutationsWithDup do
    let(:obj) { PermutationsWithDup.new }

    it 'returns all unique permutations for [1, 1, 2]' do
      nums = [1, 1, 2]
      expected = [
          [1,1,2],[1,2,1],[2,1,1]
      ]
      expect(obj.permute_unique(nums)).to eq(expected)
    end

    it 'returns all unique permutations for [2,2,1,1]' do
      nums = [2,2,1,1]
      expected = [
          [1,1,2,2],[1,2,1,2],[1,2,2,1],[2,1,1,2],[2,1,2,1],[2,2,1,1]
      ]
      expect(obj.permute_unique(nums)).to eq(expected)
    end
  end

  context NextPermutation do
    let(:obj) { NextPermutation.new }

    it 'updates from [1,2,3] to [1,3,2]' do
      nums = [1,2,3]
      expected = [1,3,2]
      obj.next_permutation(nums)
      expect(nums).to eq(expected)
    end

    it 'updates from [1,2,3] to [1,3,2]' do
      nums = [3,2,1]
      expected = [1,2,3]
      obj.next_permutation(nums)
      expect(nums).to eq(expected)
    end

    it 'updates from [1,1 5] to [1,5, 1]' do
      nums = [1,1,5]
      expected = [1,5,1]
      obj.next_permutation(nums)
      expect(nums).to eq(expected)
    end

    it 'updates from [1,2] to [2, 1]' do
      nums = [1,2]
      expected = [2,1]
      obj.next_permutation(nums)
      expect(nums).to eq(expected)
    end
  end

  context InvalidParentheses do
    let(:obj) { InvalidParentheses.new }

    it 'returns valid parens for "()())()"' do
      s = "()())()"
      expected = ["()()()", "(())()"]
      expect(obj.remove_invalid_parentheses(s)).to match_array(expected)
    end

    it 'returns valid parens for "(a)())()"' do
      s = "(a)())()"
      expected = ["(a)()()", "(a())()"]
      expect(obj.remove_invalid_parentheses(s)).to match_array(expected)
    end

    it 'returns valid parens for ")("' do
      s = ")("
      expected = [""]
      expect(obj.remove_invalid_parentheses(s)).to match_array(expected)
    end
  end
end