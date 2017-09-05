require 'rails_helper'

describe "User can access dashboard index" do
  scenario "user can see count of jobs by level of interest" do
    job1 = create(:job, level_of_interest: 20)
    job2 = create(:job, level_of_interest: 40)
    job3 = create(:job, level_of_interest: 40)
    job4 = create(:job, level_of_interest: 99)
    job5 = create(:job, level_of_interest: 99)
    job6 = create(:job, level_of_interest: 99)

    visit '/dashboard'

    expect(page).to have_css('.level_of_interest_of_20', text: '1')
    expect(page).to have_css('.level_of_interest_of_40', text: '2')
    expect(page).to have_css('.level_of_interest_of_99', text: '3')
  end

  scenario "user can see count of jobs by location" do
    job1 = create(:job, city: "Dallas")
    job2 = create(:job, city: "Boston")
    job3 = create(:job, city: "Boston")
    job4 = create(:job, city: "New York")
    job5 = create(:job, city: "New York")
    job6 = create(:job, city: "New York")

    visit '/dashboard'

    expect(page).to have_css('.count_for_Dallas', text: '1')
    expect(page).to have_css('.count_for_Boston', text: '2')
    expect(page).to have_css('.count_for_NewYork', text: '3')
  end

  scenario "user can see top three companies by average job interest" do
    companies = create_list :company, 5
    companies.each do |company|
      create(:job, company: company)
    end
    top_jobs = Job.order('level_of_interest desc').take(3)
    top_companies = top_jobs.map { |job| job.company.name }

    visit '/dashboard'

    expect(page).to have_content(top_companies.first)
    expect(page).to have_content(top_companies.last)
  end
end
