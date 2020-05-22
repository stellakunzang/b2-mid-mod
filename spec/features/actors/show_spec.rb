require "rails_helper"

RSpec.describe "actor show page" do
  it "should display the actors name and age" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

    actor1 = Actor.create(name: "John Prawn", age: 25)

    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")

    visit "/actors/#{actor1.id}"

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor1.age)
  end

  xit "should display unique list of all actors they've worked with" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio1.id}")

    actor1 = Actor.create(name: "John Prawn", age: 25)
    actor2 = Actor.create(name: "Jane Grain", age: 40)
    actor3 = Actor.create(name: "Lou Glue", age: 10)

    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor1.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor2.id}")
    MovieActor.create(movie_id: "#{movie1.id}", actor_id: "#{actor3.id}")

    visit "/actors/#{actor1.id}"

    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
  end

end


# Story 4
# As a visitor,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular actor has worked with.
