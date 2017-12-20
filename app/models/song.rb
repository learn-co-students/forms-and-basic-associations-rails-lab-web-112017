require "pry"


class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def genre_name
    self.genre.name if self.genre
  end

  def note_contents=(content)
    content.each do |c|
      self.notes << Note.new(content: c) if !c.to_s.empty?
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end





end



#
# <%= f.label :artist_name %> <%= f.text_field :artist_name %>
#
#
#
#
# <%= f.text_field :title %>
# <br/>
#
#
# <%= f.text_field :artist_name, list: "artists_autocomplete" %>
# <datalist id="artists_autocomplete">
#   <% Artist.all.each do |artist| %>
#     <option value="<%= artist.name %>">
#   <% end %>
# </datalist>
# <textarea name="song[artist]"></textarea>
