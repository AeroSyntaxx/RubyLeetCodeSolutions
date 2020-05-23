=begin
Given a binary tree, return all root-to-leaf paths.

Note: A leaf is a node with no children.

Example:

Input:

   1
 /   \
2     3
 \
  5

Output: ["1->2->5", "1->3"]

Explanation: All root-to-leaf paths are: 1->2->5, 1->3    
=end

def binary_tree_paths(root)
    return [] if root.nil?
    return ["#{root.val}"] if root.left.nil? and root.right.nil?
    
    paths = []
    explore_path("#{root.val}", root.left, paths) unless root.left.nil?
    explore_path("#{root.val}", root.right, paths) unless root.right.nil?
       
    paths
end 

def explore_path(path, node, paths)
    path += "->#{node.val}"    
    explore_path(path, node.left, paths) unless node.left.nil?
    explore_path(path, node.right, paths) unless node.right.nil?
    paths.push path if node.left.nil? and node.right.nil?
end