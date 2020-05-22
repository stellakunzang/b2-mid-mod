require "rails_helper"

RSpec.describe Movie do
  describe "relationships" do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe "class methods" do
    it "#actors_by_age" do
      studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
      movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

      actor1 = Actor.create(name: "John Prawn", age: 25)
      actor2 = Actor.create(name: "Jane Grain", age: 40)
      actor3 = Actor.create(name: "Lou Glue", age: 10)

      MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")
      MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor2.id}")
      MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor3.id}")

      expect(movie1.actors_by_age).to eq([actor3, actor1, actor2])
    end
  end
end
