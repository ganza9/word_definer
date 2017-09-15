class Word
  @@word_list = []
  attr_accessor(:word, :id)
  def initialize(word)
    @word = word
    @id = @@word_list.length + 1
  end

  def self.all
    @@word_list
  end

  def save
    @@word_list.push(self)
  end

  def self.find(id)
    def_word_id = id.to_i()
    @@word_list.each do |def_word|
      if def_word.id == def_word_id
        return def_word
      end
    end
  end
end
