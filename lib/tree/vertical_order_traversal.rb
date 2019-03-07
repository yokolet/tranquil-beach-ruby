class VerticalOrderTraversal
  # @param {TreeNode} root
  # @return {Integer[][]}
  def vertical_order(root)
    return [] if root.nil?
    result = {}
    queue = [[root, 0]] # [node, lr] lr:positive for right, negative for left
    while !queue.empty?
      node, lr = queue.shift
      result[lr] ||= []
      result[lr] << node.val
      if node.left
        queue << [node.left, lr - 1]
      end
      if node.right
        queue << [node.right, lr + 1]
      end
    end
    result.sort.map(&:last)
  end
end