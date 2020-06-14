=begin
Given a string, find the length of the longest substring without repeating characters.

Example 1:

Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end

def length_of_longest_substring(s)
    max = 0
    set = Array.new
    
    s.chars.each do |c| 
        exists = set.include? c
        
        if exists
            max = [set.size, max].max  
            set = set[set.index(c) + 1..set.size]
        end
        
        set << c
    end
    
    [set.size, max].max
end