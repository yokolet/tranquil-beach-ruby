require 'rspec'
Dir["./lib/other/*.rb"].each {|file| require file }

describe 'Other' do
  context Coins do
    let(:obj) { Coins.new }

    it 'returns 2 for n = 5' do
      n = 5
      expected = 2
      expect(obj.arrange_coins(n)).to eq(expected)
    end

    it 'returns 3 for n = 8' do
      n = 8
      expected = 3
      expect(obj.arrange_coins(n)).to eq(expected)
    end
  end

  context PalindromePairs do
    let(:obj) { PalindromePairs.new }

    it 'returns 4 pairs for ["abcd","dcba","lls","s","sssll"]' do
      words = ["abcd","dcba","lls","s","sssll"]
      expected = [[0,1],[1,0],[3,2],[2,4]]
      expect(obj.palindrome_pairs(words)).to eq(expected)
    end

    it 'returns 2 pairs for ["bat","tab","cat"]' do
      words = ["bat","tab","cat"]
      expected = [[0,1],[1,0]]
      expect(obj.palindrome_pairs(words)).to eq(expected)
    end
  end

  context ReverseInteger do
    let(:obj) { ReverseInteger.new }

    it 'returns 321 for 123' do
      x = 123
      expected = 321
      expect(obj.reverse(x)).to eq(expected)
    end

    it 'returns -321 for -123' do
      x = -123
      expected = -321
      expect(obj.reverse(x)).to eq(expected)
    end

    it 'returns 21 for 120' do
      x = 120
      expected = 21
      expect(obj.reverse(x)).to eq(expected)
    end
  end

  context SqrtApprox do
    let(:obj) { SqrtApprox.new }

    it 'returns 2 when 4 is given' do
      x = 4
      expected = 2
      expect(obj.my_sqrt(x)).to eq(expected)
    end

    it 'returns 2 when 8 is given' do
      x = 8
      expected = 2
      expect(obj.my_sqrt(x)).to eq(expected)
    end
  end

  context AdditionByString do
    let(:obj) { AdditionByString.new }

    it 'returns 1000 for 999 and 1' do
      num1 = "999"
      num2 = "1"
      expected = "1000"
      expect(obj.add_strings(num1, num2)).to eq(expected)
    end

    it 'returns 1000 for 999 and 1' do
      num1 = "1"
      num2 = "12345"
      expected = "12346"
      expect(obj.add_strings(num1, num2)).to eq(expected)
    end
  end

  context Division do
    let(:obj) { Division.new }

    it 'returns 2 for 10 / 3' do
      dividend, divisor = 10, 3
      expected = 3
      expect(obj.divide(dividend, divisor)).to eq(expected)
    end

    it 'returns -2 for 7 / -3' do
      dividend, divisor = 7, -3
      expected = -2
      expect(obj.divide(dividend, divisor)).to eq(expected)
    end

    it 'returns 2147483647 for -2147483648 / -1' do
      dividend, divisor = -2147483648, -1
      expected = 2147483647
      expect(obj.divide(dividend, divisor)).to eq(expected)
    end
  end

  context IntegerToEnglish do
    let(:obj) { IntegerToEnglish.new }

    it 'converts 123' do
      num = 123
      expected = "One Hundred Twenty Three"
      expect(obj.number_to_words(num)).to eq(expected)
    end

    it 'converts 0' do
      num = 0
      expected = "Zero"
      expect(obj.number_to_words(num)).to eq(expected)
    end

    it 'converts 50868' do
      num = 50868
      expected = "Fifty Thousand Eight Hundred Sixty Eight"
      expect(obj.number_to_words(num)).to eq(expected)
    end

    it 'converts 1234567891' do
      num = 1234567891
      expected = "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
      expect(obj.number_to_words(num)).to eq(expected)
    end
  end

  context Strobogrammatic do
    let(:obj) { Strobogrammatic.new }

    it 'returns tru fo "69"' do
      num = "69"
      expect(obj.is_strobogrammatic(num)).to be_truthy
    end

    it 'returns tru fo "69"' do
      num = "88"
      expect(obj.is_strobogrammatic(num)).to be_truthy
    end

    it 'returns tru fo "69"' do
      num = "962"
      expect(obj.is_strobogrammatic(num)).to be_falsey
    end
  end

  context ExclusiveTime do
    let(:obj) { ExclusiveTime.new }

    it 'returns [3, 4]' do
      n = 2
      logs = [
          "0:start:0",
          "1:start:2",
          "1:end:5",
          "0:end:6"
      ]
      expected = [3, 4]
      expect(obj.exclusive_time(n, logs)).to eq(expected)
    end
  end

  context RomanToInteger do
    let(:obj) { RomanToInteger.new }

    it 'return 3 for "III"' do
      s = "III"
      expected = 3
      expect(obj.roman_to_int(s)).to eq(expected)
    end

    it 'return 4 for "IV"' do
      s = "IV"
      expected = 4
      expect(obj.roman_to_int(s)).to eq(expected)
    end

    it 'return 9 for "IX"' do
      s = "IX"
      expected = 9
      expect(obj.roman_to_int(s)).to eq(expected)
    end

    it 'return 58 for "LVIII"' do
      s = "LVIII"
      expected = 58
      expect(obj.roman_to_int(s)).to eq(expected)
    end

    it 'return 1994 for "MCMXCIV"' do
      s = "MCMXCIV"
      expected = 1994
      expect(obj.roman_to_int(s)).to eq(expected)
    end
  end
end
