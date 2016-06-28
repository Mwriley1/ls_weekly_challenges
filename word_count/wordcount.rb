class Phrase
  attr_accessor :phrase

  def initialize(phrase)
    @phrase = phrase.split(/[" ",]/)
  end

  def word_count 
    word_counts = Hash.new(0)
        
    phrase.each do |word| 
      word.gsub!(/[^'\w]/,'')
      if word.match(/^'/) && word.match(/'$/)
        word.gsub!(/^'/, '')
        word.gsub!(/'$/, '')
      end
      word_counts[word.downcase] += 1 unless word.empty?
    end

    word_counts   
  end
end

phrase = Phrase.new("First: don't laugh. Then: don't cry.")

p phrase.word_count
p phrase.phrase
