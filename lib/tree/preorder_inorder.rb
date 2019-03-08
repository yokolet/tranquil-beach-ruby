require "#{File.dirname(__FILE__)}/tree_node.rb"

class PreorderInorder
  # @param {Integer[]} preorder
  # @param {Integer[]} inorder
  # @return {TreeNode}
  def build_tree(preorder, inorder)
    return [] if inorder.empty?
    idx_h = inorder.zip(inorder.size.times).to_h
    build(preorder, 0, preorder.size - 1, idx_h)
  end

  def build(preorder, p_start, p_end, idx_h)
    return nil if p_start > p_end
    val = preorder.shift
    node = TreeNode.new(val)
    node.left = build(preorder, p_start, idx_h[val] - 1, idx_h)
    node.right = build(preorder, idx_h[val] + 1, p_end, idx_h)
    node
  end
end