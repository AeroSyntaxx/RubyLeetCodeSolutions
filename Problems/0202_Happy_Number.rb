=begin
Write an algorithm to determine if a number n is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

Return True if n is a happy number, and False if not.

Example: 

Input: 19
Output: true
Explanation: 
1^2 + 9^2 = 82
8^2 + 2^2 = 68
6^2 + 8^2 = 100
1^2 + 0^2 + 0^2 = 1
=end

def is_happy(n)
    is_happy_recursive(n, [])
end

def is_happy_recursive(n, cyclers)
    return true if n == 1
    return false if cyclers.include? n
    cyclers << n
    sum = squared_digits(n).reduce(:+)
    is_happy_recursive(sum, cyclers) 
end

def squared_digits(n)
    digits = []
    while n > 0
        digit = n % 10
        digits.push digit * digit
        n /= 10        
    end
    digits
end