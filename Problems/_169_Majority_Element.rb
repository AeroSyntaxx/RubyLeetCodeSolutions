=begin
Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

Example 1:

Input: [3,2,3]
Output: 3
Example 2:

Input: [2,2,1,1,1,2,2]
Output: 2
=end

def majority_element(nums)
    majority = (nums.length / 2) + 1
    hash = Hash.new
    
    for num in nums do
        hash[num] = 0 unless hash.has_key? num
        hash[num] = hash[num].next
        
        return num if hash[num] == majority
    end
end