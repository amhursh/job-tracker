require 'rails_helper'

describe "User deletes a job" do
  scenario "a user can delete a job" do
    company = create(:company)
    create_list :job, 3, company: company
    deleted_job = company.jobs.first
    kept_job = company.jobs.last

    visit companies_path
    click_on company.name
    click_on deleted_job.title
    click_on "Delete Job"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content(kept_job.title)
    expect(page).to_not have_content(deleted_job.title)
  end
end
