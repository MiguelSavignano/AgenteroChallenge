class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :email, type: String
  field :password, type: String
  field :password_digest, type: String
  has_secure_password

  # def self.from_token_request request
  #   # Returns a valid user, `nil` or raise `Knock.not_found_exception_class_name`
  #   # e.g.
  #   #   email = request.params["auth"] && request.params["auth"]["email"]
  #   #   self.find_by email: email
  # end
end
