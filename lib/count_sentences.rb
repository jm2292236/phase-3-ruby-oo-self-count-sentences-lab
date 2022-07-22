require 'pry'

class String

    def sentence?
        self.end_with?(".")
    end
    
    def question?
        self.end_with?("?")
    end
    
    def exclamation?
        self.end_with?("!")
    end

    def count_sentences
        # Regular expression solution
        # Regular expression delimiters: / /
        # \. looks for a period
        # \. looks for a ?
        # \. looks for a !
        # | works like OR
        # 1. Creates an array with strings between each punctuation sign
        # 2. Filters that array with only the strings with letters/numbers inside
        # 3. Returns the number of strings in that array

        # self.split(/\.|\?|\!/).filter { |sentence| !sentence.empty? }.size

        # =======================================================================

        counter = 0
        prev_char = ""
        string = self.strip

        # Starts from the end of the string
        string.reverse.each_char do |char|
            if "?!.".include?(char) && !"?!.".include?(prev_char)
                counter += 1
            end

            prev_char = char
        end
        # binding.pry

        # There will be always one sentence to be counted after the last punctuation sign
        # Unless the original string was empty
        if !self.empty?
            counter += 1
        end

        counter
    end
end

# TESTS =================================================================
# puts "This is a sentence. Another one! Is this the end?".count_sentences #3
# puts "one. two. three?".count_sentences  #3
# puts "This, well, is a sentence. This is too!!!And so is this, I think? Woo... ".count_sentences  #4
# puts "This is a sentenceAnother one!! Is this the end...".count_sentences    #2
