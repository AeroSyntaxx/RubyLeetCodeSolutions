=begin
Given an integer number n, return the difference between the product of its digits and the sum of its digits.
 

Example 1:

Input: n = 234
Output: 15 
Explanation: 
Product of digits = 2 * 3 * 4 = 24 
Sum of digits = 2 + 3 + 4 = 9 
Result = 24 - 9 = 15
Example 2:

Input: n = 4421
Output: 21
Explanation: 
Product of digits = 4 * 4 * 2 * 1 = 32 
Sum of digits = 4 + 4 + 2 + 1 = 11 
Result = 32 - 11 = 21
 

Constraints:

1 <= n <= 10^5    
=end

def subtract_product_and_sum(n)
    return 0 if n == 0
    product = 1
    sum = 0
    each_digit(n) {|d| product *= d }
    each_digit(n) {|d| sum += d}
    product - sum
end

def each_digit(num)
   while num > 0 do
      yield num % 10
       num /= 10
   end
end