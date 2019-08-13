class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if genre.present?
      self.genre.name
    end
  end

  def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)

  end

  def artist_name
    if artist.present?
      self.artist.name
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_contents=(contents)
    contents.each do |c|
      self.notes << Note.new(content: c) if !c.to_s.empty?
    end
  end

end
