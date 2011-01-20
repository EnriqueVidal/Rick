class String  
  def sentences
    self.gsub(/\n|\r/,'').split(/\.\s*/)
  end
  
  def words
    self.scan(/\w[\w\'\-]*/)
  end
end

class WordPlay
  def self.switch_pronouns(text)
    text.gsub(/\b(Soy|Tu eres|Yo|Mi|Tuyo|Mio)\b/i) do |pronoun|
      case pronoun.downcase
      when "yo"
        "tu"
      when "tu"
        "mi"
      when "soy"
        "tu eres"
      when "tu eres"
        "yo soy"
      when "tu"
        "mi"
      when "mi"
        "tu"
      end
    end.sub(/^mi\b/i, 'yo')
  end
  
  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_words).length
    end
    
    ranked_sentences.last
  end
end
