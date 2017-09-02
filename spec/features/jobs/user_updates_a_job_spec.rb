require 'rails_helper'

describe "User updates a job" do
  scenario "user fills in information to update existing job" do
    company = create(:company)
    create_list :job, 3, company: company
    job = company.jobs.first

  end
end
