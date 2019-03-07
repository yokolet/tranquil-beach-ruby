class ClosestValue
  # @param {TreeNode} root
  # @param {Float} target
  # @return {Integer}
  def closest_value(root, target)
    result = root.val
    if root.val < target and root.right
      result = closest_value(root.right, target)
    end
    if root.val > target and root.left
      result = closest_value(root.left, target)
    end
    if (result - target).abs < (root.val - target).abs
      result
    else
      root.val
    end
  end
end