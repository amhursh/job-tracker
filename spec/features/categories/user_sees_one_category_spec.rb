require 'rails_helper'

describe "User visits category show" do
  scenario "and can see category" do
    category = create(:category)

    visit categories_path
    click_on category.title

    expect(current_path).to eq category_path(category)
    expect(page).to have_content(category.title)
  end
end
