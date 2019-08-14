require "pry"
class Pokemon
    attr_reader :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(idnum, db)
        output = db.execute("SELECT * FROM pokemon WHERE id = ?", idnum).flatten
        output_pokemon = Pokemon.new(id: output[0], name: output[1], type: output[2], db: db)
    end

end
