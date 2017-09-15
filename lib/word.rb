class Word
  @@list = []
  attr_accessor(:word, :id)
  def initialize(attributes)
    @word = attributes.fetch(:word)
    @id = @@list.length + 1
  end


  def self.all
    @@list
  end

  def save
    @@list.push(self)
  end

  def self.find(id)
    def_word_id = id.to_i()
    @@list.each do |def_word|
      if def_word.id == def_word_id
        return def_word
      end
    end
  end
end
