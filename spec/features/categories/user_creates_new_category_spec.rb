require 'rails_helper'

describe "User creates new category" do
  scenario "user can fill in inforamtion to create new category" do

    visit categories_path
    click_on "New Category"
    fill_in "category[title]", with: "Senior"
    click_button "Create"

    expect(current_path).to eq category_path(Category.find(1))
    expect(page).to have_content("Senior")
  end
end
