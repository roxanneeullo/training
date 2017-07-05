require 'rails_helper'

RSpec.describe "departments/show", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
      :department_name => "Department Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Department Name/)
  end
end
