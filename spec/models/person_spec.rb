require 'rails_helper'

RSpec.describe Person, type: :model do
  it "filter with or query" do
    john  = Person.create({ name: "John", age: 29, oss_projects: 3 })
    linda = Person.create({ name: "Linda", age: 29, oss_projects: 5 })
    count = Person.or(name: "John").or(oss_projects: 5).count
    or_query = { "$or" => [{ "name" => "John" }, { "oss_projects" => 5 }] }
    expect(Person.where(or_query).count).to eq count
  end

end
