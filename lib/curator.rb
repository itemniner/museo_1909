class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(artist_id)
    @artists.find do |artist|
      artist_id == artist.id
    end
  end

  def find_photograph_by_id(photo_id)
    @photographs.find do |photo|
      photo_id == photo.id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      artist.id == photo.artist_id
    end
  end

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      artist if find_photographs_by_artist(artist).length > 1
    end
  end

  def artist_by_country(country)
    @artists.find_all do |artist|
      country == artist.country
    end
  end

  def photographs_taken_by_artist_from(country)
    artist_by_country(country).map do |artist|
      @photographs.find_all do |photo|
        photo.artist_id == artist.id
      end
    end.flatten
  end
end
