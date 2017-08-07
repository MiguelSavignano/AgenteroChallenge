class Person
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  field :oss_projects, type: Integer
end
