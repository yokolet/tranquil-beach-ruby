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
end