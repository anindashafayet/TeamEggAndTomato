Feature: Login
In order to login
a User
should be able to enter a valid form to login

Scenario: Entering a valid login form
Given I am on the login page
When I fill in "Username" with "test"
And I fill in "Password" with "elton"
And I press "Log in"
Then I should see "Welcome to your page"