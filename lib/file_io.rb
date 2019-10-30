require_relative 'artist'
require_relative 'photographs'
require 'csv'

class FileIO
attr_reader :artists, :photographs
def initialize(file_paths)
  @artists = Artist.new(file_paths[:artists])
  @photographs = Photograph.new(file_paths[:photographs])
end
end
