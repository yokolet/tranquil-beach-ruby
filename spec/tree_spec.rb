require 'rspec'
Dir["./lib/tree/*.rb"].each {|file| require file }

describe 'Binary Tree' do

  context TreeNode do
    it 'construct binary tree' do
      s = "4(2(3)(1))(6(5))"
      result = TreeNode.str2tree(s)
      expect(result.val).to eq(4)
      expect(result.left.val).to eq(2)
      expect(result.left.left.val).to eq(3)
      expect(result.left.left.left).to be_nil
      expect(result.left.left.right).to be_nil
      expect(result.left.right.val).to eq(1)
      expect(result.right.val).to eq(6)
      expect(result.right.left.val).to eq(5)
      expect(result.right.right).to be_nil
    end

    it 'construct binary tree without left child' do
      s = "1(2()(5))(3)"
      result = TreeNode.str2tree(s)
      expect(result.val).to eq(1)
      expect(result.left.val).to eq(2)
      expect(result.left.left).to be_nil
      expect(result.left.right.val).to eq(5)
      expect(result.right.val).to eq(3)
      expect(result.right.left).to be_nil
      expect(result.right.right).to be_nil
    end

    it 'serializes binary tree to string' do
      s = "4(2(3)(1))(6(5))"
      result = TreeNode.str2tree(s)
      expect(TreeNode.tree2str(result)).to eq(s)
    end

    it 'serializes binary tree without left child to string' do
      s = "1(2()(5))(3)"
      result = TreeNode.str2tree(s)
      expect(TreeNode.tree2str(result)).to eq(s)
    end
  end

  context TreePath do
    it 'creates a list of all paths' do
      s = "1(2()(5))(3)"
      root = TreeNode.str2tree(s)
      result = TreePath.new.binary_tree_paths(root)
      expected = ["1->2->5", "1->3"]
      expect(result).to eq(expected)
    end
  end

  context BinaryTreeToList do
    let(:obj) { BinaryTreeToList.new }

    it 'flattens a binary list' do
      s = "1(2(3)(4))(5()(6))"
      expected = "1()(2()(3()(4()(5()(6)))))"
      root = TreeNode.str2tree(s)
      obj.flatten(root)
      expect(TreeNode.tree2str(root)).to eq(expected)
    end
  end

  context BinaryTreeDiameter do
    let(:obj) { BinaryTreeDiameter.new }

    it 'finds a diameter' do
      s = "1(2(4)(5))(3)"
      expected = 3
      root = TreeNode.str2tree(s)
      expect(obj.diameter_of_binary_tree(root)).to eq(expected)
    end
  end
end
