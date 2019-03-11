require 'rspec'
Dir["#{File.dirname(__FILE__)}/../lib/arrays_strings/*.rb"].each {|file| require file }

describe 'Arrays and Strings' do

  context ThreeSum do
    let(:obj) { ThreeSum.new }

    it 'find an answer' do
      nums = [-1, 0, 1, 2, -1, -4]
      expected = [[-1, 0, 1],
                  [-1, -1, 2]]
      expect(obj.three_sum(nums)).to match_array(expected)
    end
  end

  context ValidPalindrome do
    let(:obj) { ValidPalindrome.new }

    it 'should be true for "A man, a plan, a canal: Panama"' do
      s = "A man, a plan, a canal: Panama"
      expect(obj.is_palindrome(s)).to be_truthy
    end

    it 'should be false for "race a car"' do
      s = "race a car"
      expect(obj.is_palindrome(s)).to be_falsey
    end
  end

  context PalindromeByDeletion do
    let(:obj) { PalindromeByDeletion.new }

    it 'should return true for "aba"' do
      s = "aba"
      expect(obj.valid_palindrome(s)).to be_truthy
    end

    it 'should return true for "abca"' do
      s = "abca"
      expect(obj.valid_palindrome(s)).to be_truthy
    end
  end

  context MoveZeros do
    let(:obj) { MoveZeros.new }

    it 'should move zeros of [0,1,0,3,12]' do
      nums = [0,1,0,3,12]
      obj.move_zeroes(nums)
      expect(nums).to eq([1, 3, 12, 0, 0])
    end
  end

  context AddBinary do
    let(:obj) { AddBinary.new }

    it 'should add 11 and 1 and returns 100' do
      a = "11"
      b = "1"
      expected = "100"
      expect(obj.add_binary(a, b)).to eq(expected)
    end

    it 'should add 1010 and 1011 and returns 10101' do
      a = "1010"
      b = "1011"
      expected = "10101"
      expect(obj.add_binary(a, b)).to eq(expected)
    end
  end

  context MaxSubarraySumK do
    let(:obj) { MaxSubarraySumK.new }

    it 'returns 4 for [1, -1, 5, -2, 3] to sum 3' do
      nums = [1, -1, 5, -2, 3]
      k = 3
      expected = 4
      expect(obj.max_sub_array_len(nums, k)).to eq(expected)
    end

    it 'returns 2 for [-2, -1, 2, 1] to sum 1' do
      nums = [-2, -1, 2, 1]
      k = 1
      expected = 2
      expect(obj.max_sub_array_len(nums, k)).to eq(expected)
    end
  end

  context SubarraySumK do
    let(:obj) { SubarraySumK.new }

    it 'returns 2 for [1, 1, 1] to sum 2' do
      nums = [1, 1, 1]
      k = 2
      expected = 2
      expect(obj.subarray_sum(nums, k)).to eq(expected)
    end

    it 'return 4 for [1,2,1,2,1] to sum 3' do
      nums = [1,2,1,2,1]
      k = 3
      expected = 4
      expect(obj.subarray_sum(nums, k)).to eq(expected)
    end
  end

  context MinSubarraySum do
    let(:obj) { MinSubarraySum.new }

    it 'return 2 for [2,3,1,2,4,3] to sum 7' do
      s = 7
      nums = [2,3,1,2,4,3]
      expected = 2
      expect(obj.min_sub_array_len(s, nums)).to eq(expected)
    end
  end

  context ValidParentheses do
    let(:obj) { ValidParentheses.new }

    it 'return true for ()' do
      s = "()"
      expect(obj.is_valid(s)).to be_truthy
    end

    it 'return true for ()[]{}' do
      s = "()[]{}"
      expect(obj.is_valid(s)).to be_truthy
    end

    it 'return true for (]' do
      s = s = "(]"
      expect(obj.is_valid(s)).to be_falsey
    end

    it 'return true for ([)]' do
      s = "([)]"
      expect(obj.is_valid(s)).to be_falsey
    end

    it 'return true for {[]}' do
      s = "{[]}"
      expect(obj.is_valid(s)).to be_truthy
    end
  end

  context AllAnagrams do
    let(:obj) { AllAnagrams.new }

    it 'returns [0, 6] for s = "cbaebabacd", p = "abc"' do
      s, p = "cbaebabacd", "abc"
      expected = [0, 6]
      expect(obj.find_anagrams(s, p)).to eq(expected)
    end

    it 'returns [3, 4, 6] for s = "abaacbabc", p = "abc"' do
      s, p = "abaacbabc", "abc"
      expected = [3,4,6]
      expect(obj.find_anagrams(s, p)).to eq(expected)
    end
  end

  context TwoArrays do
    let(:obj) { TwoArrays.new }

    it 'returns [2, 2] for [1,2,2,1] and [2,2]' do
      nums1, nums2 = [1,2,2,1], [2,2]
      expected = [2, 2]
      expect(obj.intersect(nums1, nums2)).to eq(expected)
    end

    it 'returns [4,9] for [4,9,5], [9,4,9,8,4]' do
      nums1, nums2 = [4,9,5], [9,4,9,8,4]
      expected = [4, 9]
      expect(obj.intersect(nums1, nums2)).to eq(expected)
    end
  end

  context LongestSubstring do
    let(:obj) { LongestSubstring.new }

    it 'returns 3 for "abcabcbb"' do
      s = "abcabcbb"
      expected = 3
      expect(obj.length_of_longest_substring(s)).to eq(expected)
    end

    it 'returns 1 for " "' do
      s = " "
      expected = 1
      expect(obj.length_of_longest_substring(s)).to eq(expected)
    end

    it 'returns 1 for "bbbbb"' do
      s = "bbbbb"
      expected = 1
      expect(obj.length_of_longest_substring(s)).to eq(expected)
    end
  end

  context RainWater do
    let(:obj) { RainWater.new }

    it 'returns 6 for [0,1,0,2,1,0,1,3,2,1,2,1]' do
      height = [0,1,0,2,1,0,1,3,2,1,2,1]
      expected = 6
      expect(obj.trap(height)).to eq(expected)
    end
  end

  context Wildcard do
    let(:obj) { Wildcard.new }

    it 'returns false for s, p = "aa", "a"' do
      s, p = "aa", "a"
      expect(obj.is_match(s, p)).to be_falsey
    end

    it 'returns true for s, p = "aa", "*"' do
      s, p = "aa", "*"
      expect(obj.is_match(s, p)).to be_truthy
    end

    it 'returns false for s, p = "cb", "?a"' do
      s, p = "cb", "?a"
      expect(obj.is_match(s, p)).to be_falsey
    end

    it 'returns true for s, p = "adceb", "*a*b"' do
      s, p = "adceb", "*a*b"
      expect(obj.is_match(s, p)).to be_truthy
    end

    it 'returns false for s, p = "acdcb", "a*c?b"' do
      s, p = "acdcb", "a*c?b"
      expect(obj.is_match(s, p)).to be_falsey
    end
  end

  context Tasks do
    let(:obj) { Tasks.new }

    it 'returns 8' do
      tasks, n = ["A","A","A","B","B","B"], 2
      expected = 8
      expect(obj.least_interval(tasks, n)).to eq(expected)
    end
  end

  context Product do
    let(:obj) { Product.new }

    it 'returns [24,12,8,6]' do
      nums = [1,2,3,4]
      expected = [24,12,8,6]
      expect(obj.product_except_self(nums)).to eq(expected)
    end
  end
end