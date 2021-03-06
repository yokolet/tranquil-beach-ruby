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

  context ValidBST do
    let(:obj) { ValidBST.new }

    it 'return true for valid BST' do
      s = "2(1)(3)"
      expected = true
      root = TreeNode.str2tree(s)
      expect(obj.is_valid_bst(root)).to be_truthy
    end

    it 'returns false for invalid BST' do
      s = "5(1)(4(3)(6))"
      expected = false
      root = TreeNode.str2tree(s)
      expect(obj.is_valid_bst(root)).to be_falsey
    end
  end

  context LevelOrderTraversal do
    let(:obj) { LevelOrderTraversal.new }

    it 'returns level order array' do
      s = '3(9)(20(15)(7))'
      expected = [
          [3],
          [9,20],
          [15,7]
      ]
      root = TreeNode.str2tree(s)
      expect(obj.level_order(root)).to eq(expected)
    end
  end

  context VerticalOrderTraversal do
    let(:obj) { VerticalOrderTraversal.new }

    it 'returns vertical order array for "3(9)(20(15)(7))"' do
      s = '3(9)(20(15)(7))'
      expected = [
          [9],
          [3,15],
          [20],
          [7]
      ]
      root = TreeNode.str2tree(s)
      expect(obj.vertical_order(root)).to eq(expected)
    end

    it 'returns vertical order array for "3(9(4)(0))(8(1)(7)"' do
      s = '3(9(4)(0))(8(1)(7)'
      expected = [
          [4],
          [9],
          [3,0,1],
          [8],
          [7]
      ]
      root = TreeNode.str2tree(s)
      expect(obj.vertical_order(root)).to eq(expected)
    end

    it 'returns vertical order array for "3(9(4)(0()(2)))(8(1(5))(7))"' do
      s = "3(9(4)(0()(2)))(8(1(5))(7))"
      expected = [
          [4],
          [9,5],
          [3,0,1],
          [8,2],
          [7]
      ]
      root = TreeNode.str2tree(s)
      expect(obj.vertical_order(root)).to eq(expected)
    end
  end

  context ClosestValue do
    let(:obj) { ClosestValue.new }

    it 'returns 4 for ' do
      s, target = "4(2(1)(3))(5)", 3.714286
      expected = 4
      root = TreeNode.str2tree(s)
      expect(obj.closest_value(root, target)).to eq(expected)
    end
  end

  context PreorderInorder do
    let(:obj) { PreorderInorder.new }

    it 'constructs a tree "3(9)(20(15)(7))"' do
      preorder = [3,9,20,15,7]
      inorder = [9,3,15,20,7]
      expected = '3(9)(20(15)(7))'
      root = obj.build_tree(preorder, inorder)
      expect(TreeNode.tree2str(root)).to eq(expected)
    end

    it 'constructs a tree ""' do
      preorder = []
      inorder = []
      expected = []
      root = obj.build_tree(preorder, inorder)
      expect(root).to eq(expected)
    end
  end

  context RightView do
    let(:obj) { RightView.new }

    it 'returns [1, 3, 4]' do
      s = '1(2()(5))(3()(4))'
      expected = [1, 3, 4]
      root = TreeNode.str2tree(s)
      expect(obj.right_side_view(root)).to eq(expected)
    end
  end

  context MaxPathSum do
    let(:obj) { MaxPathSum.new }

    it 'returns 6 for "1(2)(3)"' do
      s = "1(2)(3)"
      expected = 6
      root = TreeNode.str2tree(s)
      expect(obj.max_path_sum(root)).to eq(expected)
    end

    it 'returns 42 for "-10(9)(20(15)(7))"' do
      s = "-10(9)(20(15)(7))"
      expected = 42
      root = TreeNode.str2tree(s)
      expect(obj.max_path_sum(root)).to eq(expected)
    end

    it 'returns -3 for "-3"' do
      s = "-3"
      expected = -3
      root = TreeNode.str2tree(s)
      expect(obj.max_path_sum(root)).to eq(expected)
    end
  end

  def build(ary, p, q)
    nodes = {}
    ary.each { |v| nodes[v] = TreeNode.new(v) if !v.nil? }
    return nodes, nodes[p], nodes[q]
  end

  context Lca do
    let(:obj) { Lca.new }

    it 'returns lca of 3' do
      nodes, p, q = build([3,5,1,6,2,0,8,nil,nil,7,4], 5, 1)
      nodes[3].left, nodes[3].right = nodes[5], nodes[1]
      nodes[5].left, nodes[5].right = nodes[6], nodes[2]
      nodes[1].left, nodes[1].right = nodes[0], nodes[8]
      nodes[2].left, nodes[2].right = nodes[7], nodes[4]
      expected = 3
      expect(obj.lowest_common_ancestor(nodes[3], p, q).val).to eq(expected)
    end

    it 'returns lca of 5' do
      nodes, p, q = build([3,5,1,6,2,0,8,nil,nil,7,4], 5, 4)
      nodes[3].left, nodes[3].right = nodes[5], nodes[1]
      nodes[5].left, nodes[5].right = nodes[6], nodes[2]
      nodes[1].left, nodes[1].right = nodes[0], nodes[8]
      nodes[2].left, nodes[2].right = nodes[7], nodes[4]
      expected = 5
      expect(obj.lowest_common_ancestor(nodes[3], p, q).val).to eq(expected)
    end
  end

  context ZigzagTraversal do
    let(:obj) { ZigzagTraversal.new }

    it 'returns zigzag starting from 3' do
      s = '3(9)(20(15)(7))'
      expected = [[3],[20,9],[15,7]]
      root = TreeNode.str2tree(s)
      expect(obj.zigzag_level_order(root)).to eq(expected)
    end

    it 'returns zigzag starting from 3' do
      s = '1(2(4))(3()(5))'
      expected = [[1],[3,2],[4,5]]
      root = TreeNode.str2tree(s)
      expect(obj.zigzag_level_order(root)).to eq(expected)
    end
  end
end
