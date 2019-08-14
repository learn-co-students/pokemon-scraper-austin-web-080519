class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        output = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
        Pokemon.new(id: output[0], name: output[1], type: output[2], db: db)
    end
end
