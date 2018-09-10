module FunWithStrings
    def palindrome?
        s_check = self.gsub(/\W/, '').downcase
        if s_check == s_check.reverse
            return true
        else
            return false
        end
    end
    def count_words
        h = Hash.new
        s = self.downcase.gsub(/[^[:word:]\s]/, '')
        s.scan(/\w+/).map{|wc| h[wc] = s.scan(/\b#{wc}\b/).size}
        return h
    end
    def anagram_groups
        rel = self.split(/\W+/)
        arr = []

        until rel.empty?
            word = rel.first
            arr.push(rel.select {|match| word.downcase.chars.sort.join.eql? (match.downcase.chars.sort.join) })
            rel.delete_if {|match| word.downcase.chars.sort.join.eql? (match.downcase.chars.sort.join)}
        end

        return arr
    end
end

# make all the above functions available as instance methods on Strings:

class String
    include FunWithStrings
    
end
