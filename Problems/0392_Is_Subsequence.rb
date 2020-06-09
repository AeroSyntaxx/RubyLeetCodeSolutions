=begin
Given a string s and a string t, check if s is subsequence of t.

A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ace" is a subsequence of "abcde" while "aec" is not).

Follow up:
If there are lots of incoming S, say S1, S2, ... , Sk where k >= 1B, and you want to check one by one to see if T has its subsequence. In this scenario, how would you change your code?

Credits:
Special thanks to @pbrother for adding this problem and creating all test cases.

 

Example 1:

Input: s = "abc", t = "ahbgdc"
Output: true
Example 2:

Input: s = "axc", t = "ahbgdc"
Output: false
 

Constraints:

0 <= s.length <= 100
0 <= t.length <= 10^4
Both strings consists only of lowercase characters.
=end
def is_subsequence(s, t)
    return true if s.empty?
    return false if t.empty? or s.length > t.length    
    
    s_ptr = 0
    t_ptr = 0

    while t_ptr < t.length and s_ptr < s.length
        if t[t_ptr] == s[s_ptr] then
            return true if s_ptr == s.length - 1   
            s_ptr = s_ptr.next
        end
        
        t_ptr = t_ptr.next
    end

    false
end