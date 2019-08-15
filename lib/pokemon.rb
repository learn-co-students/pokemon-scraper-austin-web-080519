class Pokemon

    # Connecting the class variable to the database "SQLite3::Database.new..." pass in argument of file name.
     @@database_connection = SQLite3:: Database.new('db.pokemon.db')
     #calling method 'execute' and creating a new table with all the SQL jargon. Pokemon is the table - id, name, type are the columns!
     @@database_connection.execute('CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT);')

     # ruby stuff! setters and getters so that you can call on these variables and get information!
    attr_accessor :id, :name, :type, :db
    # little different - assigning titles to each variable so we don't have to keep track later down the line!
    def initialize(id: id, name: name, type: type, db: db)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    # we need the ability to save a pokemon. create CLASS method and call on it .save method, passing through name, type and db as arguments.
    def self.save(name, type, db)
        #db stands for database - we are calling execute on that and essentially creating/filling out the information in the table we created.
        # What is ?,? -- they are the values going into the table, named right after our SQL command
        # The first ? is the second parameter - name
        # The second ? is the third parameter - type
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    # we need the abillity to find a pokemon
    # creating class method where you need to pass in the argument of the pokemon's id and the database
    def self.find(id, db)
        # let's run the SQL query to get all pokemon that have the id of teh parameter passed in
        pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        # please note: data is returned as a nested array!!! .flatten 
        array = pokemon_array.flatten
        # create new pokemon (you need to reference the array index to get inside the nested array you've built)
        Pokemon.new(id: array[0], name: array[1], type: array[2])
    end

## Additional method that is not part of the assignment. ##

    # #define an instance method with two arguments, the name you want to change the pokemon to and the db
    # def change_name(name, db)
    #     # creating a variable called new_name, going to execute on the database with a SQL query!
    #     new_name = db.execute("UPDATE pokemon SET name = ? WHERE id = ?", name, self.id)

    # end

end
