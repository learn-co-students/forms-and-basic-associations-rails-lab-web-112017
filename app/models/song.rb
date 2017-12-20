class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # validates :title, presence: true
  # validates :artist_name, presence: true
  # validates :genre_id, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
  end

   def genre_name=(name)
     self.genre = Genre.find_or_create_by(name: name)
   end

   def genre_name
     self.try(:genre).try(:name)
   end

   def note_contents=(notes)
     notes.each do |text|
         if text.strip != ''
         self.notes.build(content: text)
    end
   end
 end

   def note_contents
     self.notes.map(&:content)
   end

end
