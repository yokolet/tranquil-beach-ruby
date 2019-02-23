require 'rspec'
Dir["./lib/dp/*.rb"].each {|file| require file }

describe 'Dynamic Programming' do
  context Stock do
    let(:obj) { Stock.new }

    it 'returns 5 for [7,1,5,3,6,4]' do
      prices = [7,1,5,3,6,4]
      expected = 5
      expect(obj.max_profit(prices)).to eq(expected)
    end

    it 'returns 0 for [7,6,4,3,1]' do
      prices = [7,6,4,3,1]
      expected = 0
      expect(obj.max_profit(prices)).to eq(expected)
    end
  end

  context Stairs do
    let(:obj) { Stairs.new }

    it 'returns 2 for n = 2' do
      n = 2
      expected = 2
      expect(obj.climb_stairs(n)).to eq(expected)
    end

    it 'returns 3 for n = 3' do
      n = 3
      expected = 3
      expect(obj.climb_stairs(n)).to eq(expected)
    end
  end

  context CoinPatterns do
    let(:obj) { CoinPatterns.new }

    it 'returns 1 for amount=0, coins=[]' do
      amount = 0
      coins = []
      expected = 1
      expect(obj.change(amount, coins)).to eq(expected)
    end

    it 'returns 4 for amount=5, coins=[1, 2, 5]' do
      amount = 5
      coins = [1, 2, 5]
      expected = 4
      expect(obj.change(amount, coins)).to eq(expected)
    end

    it 'returns 0 for amount=3, coins=[2]' do
      amount = 3
      coins = [2]
      expected = 0
      expect(obj.change(amount, coins)).to eq(expected)
    end

    it 'returns 1 for amount=10, coins=[10]' do
      amount = 10
      coins = [10]
      expected = 1
      expect(obj.change(amount, coins)).to eq(expected)
    end
  end

  context MinCoinChange do
    let(:obj) { MinCoinChange.new }

    it 'returns -1 for amount=3, coins=[2]' do
      amount = 3
      coins = [2]
      expected = -1
      expect(obj.coin_change(coins, amount)).to eq(expected)
    end

    it 'returns 2 for amount=2, coins=[1]' do
      amount = 2
      coins = [1]
      expected = 2
      expect(obj.coin_change(coins, amount)).to eq(expected)
    end

    it 'returns 3 for amount=11, coins=[1, 2, 5]' do
      amount = 11
      coins = [1, 2, 5]
      expected = 3
      expect(obj.coin_change(coins, amount)).to eq(expected)
    end
  end
end
