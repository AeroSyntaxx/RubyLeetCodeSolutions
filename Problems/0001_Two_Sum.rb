=begin
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
=end

def two_sum(nums, target)    
    processed = Hash.new
    
    nums.each_with_index do |val, i|
        complement = target - val
        
        if processed.include? complement
            return [processed[complement], i]
        else
            processed[val] = i
        end        
    end     
end