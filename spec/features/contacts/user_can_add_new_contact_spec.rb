require 'rails_helper'

describe "User creates contact for a company" do
  scenario "user can fill form on company show to add a contact" do
    company = create(:company)

    visit company_path(company)
    fill_in "contact[full_name]", with: "Mr. Contact"
    fill_in "contact[position]", with: "Contactor"
    fill_in "contact[email]", with: "contact@contact.com"
    click_on "Add Contact"

    expect(current_path).to eq company_path(company)
    expect(page).to have_content("Mr. Contact")
    expect(page).to have_content("Contactor")
    expect(page).to have_content("contact@contact.com")
  end
end
