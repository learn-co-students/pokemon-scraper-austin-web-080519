
require 'pry'

class Pokemon
    @@database_connection = SQLite3::Database.new('db/pokemon.db')
    @@database_connection.execute('CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT);')
    attr_accessor :id, :name, :type, :db
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
        array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        array = array.flatten
        new_pokemon = Pokemon.new(id: id, name: array[1], type: array[2], db: db)

    end
end
