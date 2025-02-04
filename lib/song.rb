class Song
  attr_accessor :name, :artist_name
  @@all = []
  
 def self.create
    @@all << self.new
    @@all.last
  end
  
  def self.all
    @@all
  end
  
 def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
   
  end
  
   def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name)||self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort{|a,b| a.name <=> b.name }
  end
  
  def self.new_from_filename(filename)
    song_array =filename.split("-")
    song_name =song_array[1].split(".")
    song =self.new
    song.name = song_name[0].strip
    song.artist_name = song_array[0].strip
    song
  end
  
  def self.create_from_filename(filename)
    song_array =filename.split("-")
    song_name =song_array[1].split(".")
    song =self.new
    song.name = song_name[0].strip
    song.artist_name = song_array[0].strip
    @@all << song
    song
    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    self.class.all << self
  end

end