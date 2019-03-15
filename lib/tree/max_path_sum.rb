class MaxPathSum
  # @param {TreeNode} root
  # @return {Integer}
  def max_path_sum(root)
    @max_value = -Float::INFINITY
    walk = -> (root) {
      return 0 if root.nil?
      l_max = walk.call(root.left)
      r_max = walk.call(root.right)
      @max_value = [@max_value, root.val + l_max + r_max].max
      return [root.val + [l_max, r_max].max, 0].max
    }
    walk.call(root)
    @max_value
  end

  def max_path_sum2(root)
    @max_value = -Float::INFINITY
    walk = -> (root) {
      return 0 if root.nil?
      l_max = [walk.call(root.left), 0].max
      r_max = [walk.call(root.right), 0].max
      @max_value = [@max_value, root.val + l_max + r_max].max
      return [root.val, root.val + [l_max, r_max].max].max
    }
    walk.call(root)
    @max_value
  end

  def max_path_sum3(root)
    walk = -> (root, max_sofar) {
      return max_sofar, 0 if root.nil?
      max_sofar, l_max = walk.call(root.left, max_sofar)
      max_sofar, r_max = walk.call(root.right, max_sofar)
      max_sofar = [max_sofar, root.val + l_max + r_max].max
      return max_sofar, [root.val + [l_max, r_max].max, 0].max
    }
    max_value, _ = walk.call(root, -2**31)
    max_value
  end
end