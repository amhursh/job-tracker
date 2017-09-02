require 'rails_helper'

describe "User updates a job" do
  scenario "user fills in information to update existing job" do
    company = create(:company)
    create_list :job, 3, company: company
    job = company.jobs.first
    original_city = job.city

    visit companies_path
    click_on company.name
    click_on job.title
    click_on "Edit Job"
    fill_in "job[title]", with: "Cool Supervisor"
    fill_in "job[city]", with: "Gotham City"
    click_button "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Cool Supervisor")
    expect(page).to have_content("Gotham City")
    expect(page).to_not have_content(original_city)
  end
end
