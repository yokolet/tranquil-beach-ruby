class BinaryTreeToList
  # @param {TreeNode} root
  # @return {Void} Do not return anything, modify root in-place instead.
  def flatten(root)
    walk(root, nil)
  end

  def walk(root, prev)
    return prev if root.nil?
    prev = walk(root.right, prev)
    prev = walk(root.left, prev)
    root.right = prev
    root.left = nil
    root
  end
end