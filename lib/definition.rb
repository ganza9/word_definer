class Definition
  @@list = []
  attr_accessor(:definition, :id)
  def initialize(attributes)
    @id = @@list.length + 1
  end

  def self.all
    @@list
  end

  def save
    @@list.push(self)
  end

  def self.find(id)
    define_id = id.to_i()
    @@list.each do |define|
      if define.id == define_id
        return define
      end
    end
  end
end
