require 'rails_helper'

describe "User sees all jobs for a category" do
  scenario "a user visits a category and can see all associated jobs" do
    category = create(:category)
    create_list :job, 3, category: category
    first_job_title = Job.all.first.title
    last_job_title = Job.all.last.title

    visit categories_path
    click_on category.title

    expect(current_path).to eq category_path(category)
    expect(page).to have_content(first_job_title)
    expect(page).to have_content(last_job_title)
  end
end
