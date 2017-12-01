Given ("I am on the register page") do
	visit "/users/new"
end

When ("I click the {string} button") do |button|
      click_button button
    end

Then("I should see errors: {string}") do |string|
	page.has_content?(string)
end