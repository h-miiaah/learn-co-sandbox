class Album

  @@album_count = 0
  
  def initialize
    @@album_count += 1
  end
  
  def self.count
    @@album_count
  end

  def release_date=(release_date)
    @release_date = release_date
  end
  
  def release_date
    @release_date
  end
  
end