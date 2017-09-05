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
end
