class Definition
  @@def_list = []
  attr_accessor(:definition, :id)
  def initialize(definition)
    @definition = definition
    @id = @@def_list.length + 1
  end

  def self.all
    @@def_list
  end

  def save
    @@def_list.push(self)
  end

  def self.find(id)
    define_id = id.to_i()
    @@def_list.each do |define|
      if define.id == define_id
        return define
      end
    end
  end
end
