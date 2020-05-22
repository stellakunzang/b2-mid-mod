require "rails_helper"

RSpec.describe Actor do
  describe "relationships" do
    it {should have_many :movie_actors}
    it {should have_many(:movies).through(:movie_actors)}
  end

  describe "class methods" do
    it "#costars" do
      studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
      movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

      actor1 = Actor.create(name: "John Prawn", age: 25)
      actor2 = Actor.create(name: "Jane Grain", age: 40)

      MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")
      MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor2.id}")

      expect(actor1.costars).to eq(actor2)
    end
  end
end
