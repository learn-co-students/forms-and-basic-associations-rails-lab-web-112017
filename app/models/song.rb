class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def create
    artist_name = params[:song][:artist_name]
    genre_name = params[:song][:genre_name]
  end


  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    if self.notes
      self.notes.map {|note| note.content}
    end
  end

  def note_contents=(notes)
    if !notes.empty?

      if notes.class == Array
        notes.each do |note|
          if !note.empty?
            self.notes << Note.find_or_create_by(content: note)
          end
        end
      elsif notes.class == String
          self.notes << Note.find_or_create_by(content: notes)
      end
    end


  end







end
