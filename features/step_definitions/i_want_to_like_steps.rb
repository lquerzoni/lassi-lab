#require "rails_helper"

Given("I am on the home page") do
  visit root_path
end

Given("There is at least one listed movie with reviews") do
  @mov = create(:movie)
  @user = create(:moviegoer)
  create(:review, movie_id: @mov.id, moviegoer_id: @user.id)
end

Given("I am on the movie details page") do
  page.has_content?(@mov.title)
end


When /^I click on \"(.+)\".*$/ do |string|
  click_link(string)
end

Then("I should see the like counter increased by one") do
  expect(page).to have_content("1 Like")
end
