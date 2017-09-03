require 'rails_helper'

describe "User accesses new category form" do
  scenario "and can fill in inforamtion to create new category" do

    visit categories_path
    click_on "New Category"
    fill_in "category[title]", with: "Senior"
    click_button "Create"

    expect(current_path).to eq category_path(Category.find(1))
    expect(page).to have_content("Senior")
    expect(page).to have_content("'Senior' category added")
  end

  scenario "and uses duplicate title and is returned to new form" do
    category = create(:category)

    visit categories_path
    click_on "New Category"
    fill_in "category[title]", with: category.title
    click_button "Create"

    expect(current_path).to eq new_category_path
    expect(page).to have_content("Error! '#{category.title}' category already exists")
  end
end
