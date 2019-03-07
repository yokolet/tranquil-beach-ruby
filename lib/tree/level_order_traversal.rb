class LevelOrderTraversal
  # @param {TreeNode} root
  # @return {Integer[][]}
  def level_order(root)
    return [] if root.nil?
    queue = [root]
    result = []
    while !queue.empty?
      result << []
      queue.length.times do
        q = queue.shift
        result[-1] << q.val
        queue << q.left if q.left
        queue << q.right if q.right
      end
    end
    result
  end

  def level_order2(root)
    return [] if root.nil?
    queue = [root]
    result = []
    while !queue.empty?
      result << []
      tmp = []
      queue.each do |q|
        result[-1] << q.val
        if q.left
          tmp << q.left
        end
        if q.right
          tmp << q.right
        end
      end
      queue = tmp
    end
    result
  end
end