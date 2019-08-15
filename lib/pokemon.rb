
class Pokemon
attr_accessor :name, :type, :id, :db
 
def initialize(id: id, name: name, type: type, db: db)
    @id = id 
    @name = name 
    @type = type 
    @db = db
end 
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        arrr = arr.flatten
        new_pokemon = Pokemon.new(id: id, name: arrr[1], type: arrr[2], db: db)

    end

end
