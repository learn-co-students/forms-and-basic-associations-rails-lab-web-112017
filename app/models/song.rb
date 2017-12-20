class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(genre_id)
    self.genre = Genre.find(genre_id)
  end

  def genre_name
    if self.genre
      self.genre.name
    else
      'a generic genre'
    end
  end

  def genre_name=(name)
    temp_genre = Genre.find_or_create_by(name: name)
    self.genre = temp_genre
  end

  def artist_name=(name)
    self.artist.name = name
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      'this thing is broken'
    end
  end

  def note_contents=(note)
    note.each do |n|
      new_note = Note.create(content: n)
      self.notes << new_note
    end
  end

  def note_contents
     self.notes.collect do |note|
      note.content
    end.select{|note| note != ""}
  end

  def artist_name=(a_name)
    self.artist = Artist.find_or_create_by(name: a_name)
  end
end
