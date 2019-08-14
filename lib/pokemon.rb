class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        pokemon_extraction = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
        #this returns an array of an array, so we need to 'flatten' 
        Pokemon.new(id:pokemon_extraction[0], name:pokemon_extraction[1], type:pokemon_extraction[2], db:db)
    end

end