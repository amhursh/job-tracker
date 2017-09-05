require 'rails_helper'

describe "User can access dashboard index" do
  scenario "user can see count of jobs by level of interest" do
    job1 = create(:job, level_of_interest: 20)
    job2 = create(:job, level_of_interest: 40)
    job3 = create(:job, level_of_interest: 40)
    job4 = create(:job, level_of_interest: 99)
    job5 = create(:job, level_of_interest: 99)
    job6 = create(:job, level_of_interest: 99)

    visit dashboard_path

    expect(page).to have_content("20:1")
    expect(page).to have_content("40:2")
    expect(page).to have_content("99:3")
  end
end
