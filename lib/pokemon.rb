class Pokemon
  
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db 
    @@all << self
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    searched_pokemon = db.execute("SELECT FROM pokemon where pokemon.id = ?, id").flatten
    Pokemon.new(id: searched_pokemon[0], name: searched_pokemon[1], type: searched_pokemon[2], db: db) 
  end
end
