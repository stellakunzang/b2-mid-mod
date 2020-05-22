require "rails_helper"

RSpec.describe "movie show page" do
  it "should display the movie title, year, and genre" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.year)
    expect(page).to have_content(movie1.genre)
  end

  it "should list all actors from youngest to oldest" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

    actor1 = Actor.create(name: "John Prawn", age: 25)
    actor2 = Actor.create(name: "Jane Grain", age: 40)
    actor3 = Actor.create(name: "Lou Glue", age: 10)

    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor2.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor3.id}")

    visit "/movies/#{movie1.id}"

    expect(actor1.name).to appear_before(actor2.name)
    expect(actor3.name).to appear_before(actor1.name)
  end

  it "should display average age of all the actors" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

    actor1 = Actor.create(name: "John Prawn", age: 25)
    actor2 = Actor.create(name: "Jane Grain", age: 40)
    actor3 = Actor.create(name: "Lou Glue", age: 10)

    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor2.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor3.id}")

    visit "/movies/#{movie1.id}"

    expect(page).to have_content("Average Age = 25")
  end
end
# Story 2
# As a visitor,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
