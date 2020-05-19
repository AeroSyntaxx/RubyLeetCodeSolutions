=begin
Given a positive integer num, write a function which returns True if num is a perfect square else False.

Follow up: Do not use any built-in library function such as sqrt.
=end

def is_perfect_square(num)
    return true if num == 1
    return false if [2,3,7,8].include? num % 10
    (2..num / 2).each { |n| return true if n * n == num}
    false
end