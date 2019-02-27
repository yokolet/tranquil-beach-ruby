class BinaryTreeDiameter
  # @param {TreeNode} root
  # @return {Integer}
  def diameter_of_binary_tree(root)
    _, d = walk(root)
    d
  end

  def walk(root) # returns height and diameter
    return 0, 0 if root.nil?
    l_h, l_d = walk(root.left)
    r_h, r_d = walk(root.right)
    h = 1 + [l_h, r_h].max
    d = [l_h + r_h, l_d, r_d].max
    return h, d
  end
end