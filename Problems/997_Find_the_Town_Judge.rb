=begin
In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

The town judge trusts nobody.
Everybody (except for the town judge) trusts the town judge.
There is exactly one person that satisfies properties 1 and 2.
You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

 

Example 1:

Input: N = 2, trust = [[1,2]]
Output: 2
Example 2:

Input: N = 3, trust = [[1,3],[2,3]]
Output: 3
Example 3:

Input: N = 3, trust = [[1,3],[2,3],[3,1]]
Output: -1
Example 4:

Input: N = 3, trust = [[1,2],[2,3]]
Output: -1
Example 5:

Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
Output: 3
=end

def find_judge(n, trust)
    return 1 if n == 1 and trust.empty?
    trusters, trust_hash = create_trust_data(trust)
    
    trust_hash.each { |trustee, trust_count|
        return trustee if trust_count == n-1 and not trusters.include? trustee
    }
    
    -1 
end

def create_trust_data(trust)
    trust_hash = Hash.new
    trusters = Array.new
    
    trust.each { |pair| 
        truster = pair[0]
        trustee = pair[1]
        trust_hash[trustee] = 0 unless trust_hash.has_key? trustee
        trust_hash[trustee] = trust_hash[trustee].next
        trusters << truster unless trusters.include? truster
    }
    
    [trusters, trust_hash]
end