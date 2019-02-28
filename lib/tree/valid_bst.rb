class ValidBST
  # @param {TreeNode} root
  # @return {Boolean}
  def is_valid_bst(root)
    walk(root, nil, nil)
  end

  def walk(root, lower, upper)
    return true if root.nil?
    if (lower.nil? || root.val > lower) &&
        (upper.nil? || root.val < upper)
      return walk(root.left, lower, root.val) &&
          walk(root.right, root.val, upper)
    else
      return false
    end
  end
end