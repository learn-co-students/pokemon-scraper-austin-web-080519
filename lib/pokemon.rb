class Pokemon
    #@@database_connection = SQLite3::Database.new('db/pokemon.db')
    #@@database_connection.execute('CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT);')
    #^creates the table
    attr_accessor :id, :name, :type, :db

    #universal method to take in attributes from something like an API
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

    def change_name(name, db)
        db.execute("UPDATE pokemon SET name = '?' WHERE id = ? ", name, self.id)
    end

    #Pikachu.change_name("JigglyPuff", pokemon)
end