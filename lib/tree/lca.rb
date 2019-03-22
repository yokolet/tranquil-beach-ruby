require "#{File.dirname(__FILE__)}/tree_node.rb"
require 'set'

class Lca
  # @param {TreeNode} root
  # @param {TreeNode} p
  # @param {TreeNode} q
  # @return {TreeNode}
  def lowest_common_ancestor(root, p, q)
    return root if !root || root == p || root == q
    left = lowest_common_ancestor(root.left, p, q)
    right = lowest_common_ancestor(root.right, p, q)
    return root if left && right
    left ? left : right
  end

  def lowest_common_ancestor2(root, p, q)
    stack = [root]
    parent = {root => nil}
    while !stack.empty?
      cur = stack.pop
      if cur.left
        parent[cur.left] = cur
        stack.push(cur.left)
      end
      if cur.right
        parent[cur.right] = cur
        stack.push(cur.right)
      end
    end
    parents = Set.new
    while p
      parents << p
      p = parent[p]
    end
    while !parents.include?(q)
      q = parent[q]
    end
    q
  end
end