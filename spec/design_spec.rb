require 'rspec'
Dir["#{File.dirname(__FILE__)}/../lib/design/*.rb"].each {|file| require file }
require "#{File.dirname(__FILE__)}/../lib/tree/tree_node.rb"

describe 'Design' do
  context WordDictionary do
    it 'add and search words' do
      ops = ["WordDictionary","add_word","add_word","add_word","search","search","search","search"]
      params = [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
      expected = [nil,nil,nil,nil,false,true,true,true]
      obj = Object::const_get(ops[0]).new(*params[0])
      result = [nil]
      ops[1..-1].zip(params[1..-1]).each do |op, param|
        result << obj.send(op, *param)
      end
      expect(result).to eq(expected)
    end
  end

  context BadVersion do
    let(:obj) { BadVersion.new }

    it 'return 4 among 5' do
      allow(obj).to receive(:is_bad_version) do |arg|
        arg >= 4 ? true : false
      end
      n = 5
      expected = 4
      expect(obj.first_bad_version(n)).to eq(expected)
    end
  end

  context BSTIterator do
    it 'iterates bst' do
      s = '7(3)(15(9)(20))'
      root = TreeNode.str2tree(s)
      iterator = BSTIterator.new(root)
      expect(iterator.next).to eq(3)
      expect(iterator.next).to eq(7)
      expect(iterator.has_next).to be_truthy
      expect(iterator.next).to eq(9)
      expect(iterator.has_next).to be_truthy
      expect(iterator.next).to eq(15)
      expect(iterator.has_next).to be_truthy
      expect(iterator.next).to eq(20)
      expect(iterator.has_next).to be_falsey
    end
  end

  context NumMatrix do
    it 'responds to queries' do
      matrix = [
          [3, 0, 1, 4, 2],
          [5, 6, 3, 2, 1],
          [1, 2, 0, 1, 5],
          [4, 1, 0, 1, 7],
          [1, 0, 3, 0, 5]
      ]
      obj = NumMatrix.new(matrix)
      expect(obj.sum_region(2, 1, 4, 3)).to eq(8)
      expect(obj.sum_region(1, 1, 2, 2)).to eq(11)
      expect(obj.sum_region(1, 2, 2, 4)).to eq(12)
    end
  end
end