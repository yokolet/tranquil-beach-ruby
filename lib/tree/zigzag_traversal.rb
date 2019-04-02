require "#{File.dirname(__FILE__)}/tree_node.rb"

class ZigzagTraversal
  # @param {TreeNode} root
  # @return {Integer[][]}
  def zigzag_level_order(root)
    return [] if root.nil?
    queue, lr, result = [root], false, []
    while !queue.empty?
      tmp = []
      queue.size.times do
        if lr
          node = queue.pop
          tmp << node.val
          queue.unshift(node.right) if !node.right.nil?
          queue.unshift(node.left) if !node.left.nil?
        else
          node = queue.shift
          tmp << node.val
          queue << node.left if !node.left.nil?
          queue << node.right if !node.right.nil?
        end
      end
      result << tmp
      lr = !lr
    end
    result
  end
end