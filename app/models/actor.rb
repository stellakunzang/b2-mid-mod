class Actor < ApplicationRecord
  validates_presence_of :name, :age
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def costars
    costars = []
    movies.each do |movie|
      movie.actors.each do |actor|
        if actor != self
          costars << actor
        end 
      end
    end
    costars.uniq
  end
end
