require 'rails_helper'

describe "User visits categories index" do
  scenario "and clicks the delete button to delete a category" do
    create_list :category, 6
    first = Category.first
    last = Category.last

    visit categories_path
    within(".category_#{first.title}") do
      click_link "Delete"
    end

    expect(current_path).to eq categories_path
    expect(page).to have_content("#{first.title} category successfully deleted!")
  end
end
