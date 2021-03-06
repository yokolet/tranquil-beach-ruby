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

  context LRUCache do
    it 'cache data in least recently used manner - 1' do
      ops = ["LRUCache","put","put","get","put","get","put","get","get","get"]
      params = [[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
      expected = [nil,nil,nil,1,nil,-1,nil,-1,3,4]
      cache = LRUCache.new(2)
      result = [nil]
      (1...ops.size).each do |i|
        result << cache.send(ops[i], *params[i])
      end
      expect(result).to eq(expected)
    end

    it 'cache data in least recently used manner - 2' do
      ops = ["LRUCache","get","put","get","put","put","get","get"]
      params = [[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
      expected = [nil,-1,nil,-1,nil,nil,2,6]
      cache = LRUCache.new(2)
      result = [nil]
      (1...ops.size).each do |i|
        result << cache.send(ops[i], *params[i])
      end
      expect(result).to eq(expected)
    end

    it 'cache' do
      ops = ["LRUCache","put","put","put","put","get","get"]
      params = [[2],[2,1],[1,1],[2,3],[4,1],[1],[2]]
      null = nil
      expected = [null,null,null,null,null,-1,3]
      cache = LRUCache.new(2)
      result = [nil]
      (1...ops.size).each do |i|
        result << cache.send(ops[i], *params[i])
      end
      expect(result).to eq(expected)
    end
  end

  context MinStack do
    let(:obj) { MinStack.new }

    it 'returns min by O(1)' do
      obj.push(-2)
      obj.push(0)
      obj.push(-3)
      expect(obj.get_min).to eq(-3)
      obj.pop
      expect(obj.top).to eq(0)
      expect(obj.get_min).to eq(-2)
    end
  end

  context RandomPick do
    it 'picks by weight 1' do
      ops = ["RandomPick","pick_index"]
      params = [[[1]],[]]
      expected = [nil,0]
      obj = Object::const_get(ops[0]).new(*params[0])
      result = [nil]
      ops[1..-1].zip(params[1..-1]).each do |op, param|
        result << obj.send(op, *param)
      end
      puts result
      expect(result).to eq(expected)
    end

    it 'picks by weight 2' do
      ops = ["RandomPick","pick_index","pick_index","pick_index","pick_index","pick_index"]
      params = [[[1,3]],[],[],[],[],[]]
      expected = [nil,0,1,1,1,0]
      obj = Object::const_get(ops[0]).new(*params[0])
      result = [nil]
      ops[1..-1].zip(params[1..-1]).each do |op, param|
        result << obj.send(op, *param)
      end
      puts result
      expect(result).to eq(expected)
    end
  end

  context KthLargest do
    it 'returns kth largest' do
      ops = ["KthLargest","add","add","add","add","add"]
      params = [[3,[4,5,8,2]],[3],[5],[10],[9],[4]]
      expected = [nil,4,5,5,8,8]
      obj = Object::const_get(ops[0]).new(*params[0])
      result = [nil]
      ops[1..-1].zip(params[1..-1]).each do |op, param|
        result << obj.send(op, *param)
      end
      expect(result).to eq(expected)
    end

  end
end