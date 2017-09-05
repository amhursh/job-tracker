require 'rails_helper'

describe "User can access jobs index" do
  scenario "user sees all jobs" do
    company = create(:company)
    create_list :job, 5, company: company

    visit jobs_path

    expect(current_path).to eq jobs_path
    expect(page).to have_content(company.jobs.first.title)
    expect(page).to have_content(company.jobs.last.title)
  end

  scenario "user can see jobs sorted by city" do
    company = create(:company)
    job1 = create(:job, city: "AAAA")
    job2 = create(:job, city: "ZZZZ")
    job3 = create(:job, city: "YYYY")

    visit '/jobs/?sort=location'

    expect(job1.title).to appear_before(job2.title)
    expect(job3.title).to appear_before(job2.title)
    expect(job3.title).to_not appear_before(job1.title)
  end

  scenario "user can see jobs sorted by level_of_interest" do
    company = create(:company)
    job1 = create(:job, level_of_interest: 99)
    job2 = create(:job, level_of_interest: 1)
    job3 = create(:job, level_of_interest: 50)

    visit '/jobs/?sort=interest'

    expect(job1.title).to appear_before(job2.title)
    expect(job3.title).to appear_before(job2.title)
    expect(job1.title).to appear_before(job3.title)
  end
end
