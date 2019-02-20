require "#{File.dirname(__FILE__)}/tree_node.rb"

class TreePath
  # @param {TreeNode} root
  # @return {String[]}
  def binary_tree_paths(root)
    result = []
    return result if root.nil?
    walk(root, '', result)
    result
  end

  def walk(root, path, result)
    path += root.val.to_s
    result << path if root.left.nil? && root.right.nil?
    walk(root.left, path + '->', result) if root.left
    walk(root.right, path + '->', result) if root.right
  end
end
