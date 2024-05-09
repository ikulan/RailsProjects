class Password < ApplicationRecord
  has_many :user_passwords
  has_many :users, through: :user_passwords

  encrypts :username, deterministic: true  # so this field is queryable
  encrypts :password
end
