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

  it "should display a form to add an existing actor to the movie" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

    actor1 = Actor.create(name: "John Prawn", age: 25)
    actor2 = Actor.create(name: "Jane Grain", age: 40)
    actor3 = Actor.create(name: "Lou Glue", age: 10)

    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor2.id}")

    visit "/movies/#{movie1.id}"

    expect(page).to have_no_content(actor3.name)

    fill_in :name, with: "#{actor3.name}"

    expect(current_path).to eq("/movies/#{movie1.id}")
    expect(page).to have_content(actor3.name)
  end
end


# Story 3
# As a visitor,
# When I visit a movie show page,
# I see a form for an actors name
# and when I fill in the form with an existing actor's name
# I am redirected back to that movie's show page
# And I see the actor's name listed
# (This should not break story 3, You do not have to test for a sad path)
