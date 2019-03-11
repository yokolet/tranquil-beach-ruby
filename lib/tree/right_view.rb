require "#{File.dirname(__FILE__)}/tree_node.rb"

class RightView
  # @param {TreeNode} root
  # @return {Integer[]}
  def right_side_view(root)
    depth, result = -1, []
    return result if root.nil?
    queue = [[root, 0]]
    while !queue.empty?
      node, level = queue.shift
      if depth < level
        result << node.val
        depth = level
      end
      if node.right
        queue << [node.right, level + 1]
      end
      if node.left
        queue << [node.left, level + 1]
      end
    end
    result
  end
end