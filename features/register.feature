Feature: register
In order to create an account
a User
should enter a valid form to create an account

Scenario: Entering a valid register form
Given I am on the register page
And I click the "Register Now!" button
Then I should see errors: "Username can't be blank"