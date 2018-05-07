Feature: I want to add "like" to reviews
	As a user
	I want to add like to review
	Such that reviews with more than 5 likes are highlighted

Scenario: like a nice movie
	Given There is at least one listed movie with reviews
	And I am on the home page
	When I click on "Details" of the first listed movie
	Given I am on the movie details page
	When I click on "I Like"
	Then I should see the like counter increased by one
