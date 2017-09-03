require 'rails_helper'

describe "User visits categories index" do
  scenario "and clicks the edit link to edit a category" do
    category = create(:category)

    visit categories_path
    within(".category_#{category.title}") do
      click_link "Edit"
    end
    fill_in "category[title]", with: "Finance"
    click_button "Update"

    expect(current_path).to eq category_path(category)
    expect(page).to have_content("Finance")
    expect(page).to have_content("'Finance' category updated")
  end

  scenario "and tries invalid category and is redirected back to edit form" do
    category = create(:category)

    visit categories_path
    within(".category_#{category.title}") do
      click_link "Edit"
    end
    fill_in "category[title]", with: nil
    click_button "Update"

    expect(current_path).to eq edit_category_path(category)
    expect(page).to have_content("Error! Must provide title for category")
  end
end
