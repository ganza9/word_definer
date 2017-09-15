class Word  
  @@list - []
  attr_accessor
  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = attributes.fetch(:definition)
    @id = @@list.length + 1
  end
end

def self.all
  @@list
end

def save
  @@list.push(self)
end

def self.find(id)
  word_id = id.to_i()
  @@list.each do |word|
    if word.id == word_id
      return word
    end
  end
end
