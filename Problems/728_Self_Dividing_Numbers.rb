=begin
A self-dividing number is a number that is divisible by every digit it contains.

For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.

Also, a self-dividing number is not allowed to contain the digit zero.

Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.

Example 1:
Input: 
left = 1, right = 22
Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
Note:

The boundaries of each input argument are 1 <= left <= right <= 10000.
=end

def self_dividing_numbers(left, right)
    (left..right).select { |n| is_self_dividing(n) }
end

def is_self_dividing(num)
    each_digit(num) { |d| return false if d == 0 or num % d != 0 }
    true
end

def each_digit(num)
    while num > 0 do
        yield num % 10
        num /= 10
    end
end