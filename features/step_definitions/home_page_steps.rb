Given("I am on the home page") do
  visit root_path
end

Then("I should see some listings") do
  page.has_content?("client request")
end