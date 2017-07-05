require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        :department_name => "Department Name"
      ),
      Department.create!(
        :department_name => "Department Name"
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => "Department Name".to_s, :count => 2
  end
end
