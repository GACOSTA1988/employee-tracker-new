require 'rails_helper'

describe Employee do
  it { should have_many(:divisions) }
  it { should have_many(:projects) }
  it { should validate_length_of(:name).is_at_most(100) }
  it { should validate_presence_of :name }
end
describe Employee do
  it("titleizes the name of an employee") do
    employee = Employee.create({name: "giant steps"})
    expect(employee.name()).to(eq("Giant Steps"))
  end
end
