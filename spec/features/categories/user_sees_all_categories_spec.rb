require 'rails_helper'

describe "User visits categories index" do
  scenario "and can see all categories" do
    create_list :category, 6
    first = Category.first.title
    last = Category.last.title

    visit categories_path

    expect(page).to have_content(first)
    expect(page).to have_content(last)
  end
end
