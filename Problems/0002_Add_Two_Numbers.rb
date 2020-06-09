=begin
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
def add_two_numbers(l1, l2)
    l1_str = to_reverse_string(l1)
    l2_str = to_reverse_string(l2)

    head = nil
    node = nil

    yield_digits(l1_str.to_i + l2_str.to_i) do |i| 
        if node.nil?
            node = ListNode.new
            head = node            
        else 
            node.next = ListNode.new
            node = node.next
        end

        node.val = i
    end

    head
end

def to_reverse_string(l)
    s = ""
    yield_values(l) { |i| s << i.to_s }
    s.reverse
end

def yield_values(l)
    node = l
    until node.nil? 
        yield node.val
        node = node.next
    end
end

def yield_digits(i)
    yield 0 if i == 0

    while i > 0
        yield i % 10
        i = i / 10
    end
end