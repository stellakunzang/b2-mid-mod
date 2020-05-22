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
  end
end


# Story 1
# As a visitor,
# When I visit the studio index page
# I see a list of all of the movie studios
# And underneath each studio, I see the names of all of its movies.
