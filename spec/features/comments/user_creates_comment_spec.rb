require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment for a job" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)
    fill_in "comment[content]", with: "test comment xzy"
    click_on "Add Comment"
    fill_in "comment[content]", with: "Yahoooooo"
    click_on "Add Comment"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content("test comment xzy")
    expect(page).to have_content("Yahoooooo")
  end
end
