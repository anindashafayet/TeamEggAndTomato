Given("I am on the login page") do
	visit "/login"
end

When("I fill in {string} with {string} ") do |string, string2|
	fill_in(string, with:string2)
end

When("I fill in {string} with {string}") do |string, string2|
	fill_in(string, with:string2)
end

When("I press {string}") do |string|
	click_on string
end

Then("I should see {string}") do |string|
	page.has_content?(string)
end