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
end