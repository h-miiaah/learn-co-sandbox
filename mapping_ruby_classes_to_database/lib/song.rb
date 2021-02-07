class Song
  
  attr_accessor :name, :album 
  attr_reader :id
  
  def initialize(name, album, id = nil)
    @id = id
    @name = name
    @album = album
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS songs(
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end
  
  def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO songs(name, album)
        VALUES (?, ?)
        SQL
      
      DB[:conn].execute(sql, self.name, self.album)
      
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
    end
  end
  
  def update
    sql = "UPDATE songs SET name = ?, album = ?, id =?"
    DB[:conn].execute(sql, self.name, self.album, self.id)
  end
  
  def self.create(name, album)
    song = Song.new(name, album)
    song.save
    song
  end
  
  def self.find_by_id(id)
    sql = "SELECT * FROM songs WHERE id = ?"
    result = DB[:conn].execute(sql, id)[0]
    Song.new(result[0], result[1], result[2])
  end
  
  def self.find_or_create_by(name:, album:)
    song = DB[:conn].execute("SELECT * FROM songs WHERE name = ? AND album = ?", name, album)
      if !song.empty?
        song_data = song[0]
        song = Song.new(song_data[0], song_data[1], song_data[2])
      else
        song = self.create(name: name, album: album)
      end
      song
  end
  
  
  Song.create_table
  # hello = Song.new("Hello", "25")
  ninety_nine_problems = Song.new("99 Problems", "The Black Album")
  
  # hello.save
  ninety_nine_problems.save
  
  song = Song.create(name: "Hello", album: "25")
  # => #<Song:0x007f94f2c28ee8 @id=1, @name="Hello", @album="25">
  
  song.name
  # => "Hello"
   
  song.album
  # => "25"
  
  Song.find_or_create_by(name: "Hello", album: "25")
  Song.find_or_create_by(name: "Hello", album: "25")
  DB[:conn].execute("SELECT * FROM songs WHERE name = Hello, album = 25")
  # => [[1, "Hello", "25"]]
  
end