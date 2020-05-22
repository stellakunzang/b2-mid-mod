require "rails_helper"

RSpec.describe "studio index page" do
  it "should display a list of all the movie studios" do
    studio1 = Studio.create(name: "The Movie Studio", location: "The Moon")
    studio2 = Studio.create(name: "Another Movie Studio", location: "Mars")

    visit "/studios"

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio2.name)
  end

  it "should display the names of movies underneath each studio" do
    studio = Studio.create(name: "The Movie Studio", location: "The Moon")
    studio2 = Studio.create(name: "Another Movie Studio", location: "Mars")
    movie1 = Movie.create(title: "A Movie", year: "1999", genre: "Spooky", studio_id: "#{studio.id}")
    movie2 = Movie.create(title: "Movie: Sequel", year: "2002", genre: "Spooky", studio_id: "#{studio.id}")

    visit "/studios"

    within ".studio-#{studio.id}" do
      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
    end

    within ".studio-#{studio2.id}" do
      expect(page).to have_no_content(movie1.title)
      expect(page).to have_no_content(movie2.title)
    end

  end
end
