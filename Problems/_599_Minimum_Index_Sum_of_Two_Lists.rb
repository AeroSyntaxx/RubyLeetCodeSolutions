=begin
Suppose Andy and Doris want to choose a restaurant for dinner, and they both have a list of favorite restaurants represented by strings.

You need to help them find out their common interest with the least list index sum. If there is a choice tie between answers, output all of them with no order requirement. You could assume there always exists an answer.

Example 1:
Input:
["Shogun", "Tapioca Express", "Burger King", "KFC"]
["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]
Output: ["Shogun"]
Explanation: The only restaurant they both like is "Shogun".
Example 2:
Input:
["Shogun", "Tapioca Express", "Burger King", "KFC"]
["KFC", "Shogun", "Burger King"]
Output: ["Shogun"]
Explanation: The restaurant they both like and have the least index sum is "Shogun" with index sum 1 (0+1).
Note:
The length of both lists will be in the range of [1, 1000].
The length of strings in both lists will be in the range of [1, 30].
The index is starting from 0 to the list length minus 1.
No duplicates in both lists.
=end

def find_restaurant(list1, list2)
    big_list = nil
    small_list = nil
    least_index = nil
    result = []
    
    if list1.length >= list2.length 
        big_list = list1
        small_list = list2
    else
        big_list = list2
        small_list = list1
    end
        
    big_list.each_with_index do |restaurant, index|
        index_in_other_list = small_list.index(restaurant)
        next if index_in_other_list.nil?
        
        index_sum = index + index_in_other_list
        
        if least_index.nil? or index_sum < least_index
            result.clear
            least_index = index_sum
            result.push restaurant
        elsif index_sum == least_index
            result.push restaurant
        end        
    end
    
    result
end