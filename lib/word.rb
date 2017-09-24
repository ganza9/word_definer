class Word
 attr_accessor :vocabulary_word, :definition
 attr_reader :id
  @@list = []
  @@definitions_list = []

 def initialize(vocabulary_word, definition)
   @vocabulary_word = vocabulary_word
   @definition = definition
  @id = @@list.length + 1
 end

 def self.all()
   @@list
 end
 def save ()
   @@list.push(self)
 end
 def self.clear()
   @@list = []
 end
 def self.find(id)
   word_id = id.to_i
   @@list.each do |word|
     if word.id == word_id
       return word
     end
   end
 end
end
