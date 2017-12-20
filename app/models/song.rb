class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(notes_array)
    notes_array.reject! {|string| string == ""}
    notes_array.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.try(:genre).try(:name)
  end
end
