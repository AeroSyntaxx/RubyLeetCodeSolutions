=begin
Find the sum of all left leaves in a given binary tree.

Example:

    3
   / \
  9  20
    /  \
   15   7

There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
=end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def sum_of_left_leaves(root)
    return 0 if root.nil?    
    sum_branches(root)
end

# Return the sum of the right branch's left leaves of the tree node.
# @param {TreeNode} root
# @return {Integer}
def sum_of_right_branch(root)            
    sum_branches(root)
end

# Return the sum of the right branch's left leaves of the tree node.
# @param {TreeNode} root
# @return {Integer}
def sum_of_left_branch(root)
    sum = sum_branches(root)
    sum += root.val if root.left.nil? and root.right.nil?
    
    sum
end

# Return the sum of the branches' left leaves of the tree node.
# @param {TreeNode} root
# @return {Integer}
def sum_branches(root)
    sum = 0
    sum += sum_of_left_branch(root.left) unless root.left.nil?
    sum += sum_of_right_branch(root.right) unless root.right.nil?
    
    sum
end