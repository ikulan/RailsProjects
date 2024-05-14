class Password < ApplicationRecord
  before_create :randomize_id

  has_many :user_passwords, dependent: :destroy
  has_many :users, through: :user_passwords

  encrypts :username, deterministic: true  # so this field is queryable
  encrypts :password

  validates :url, presence: true
  validates :username, presence: true
  validates :password, presence: true

  def shareable_users
    User.excluding(users)
  end

  def editable_by?(user)
    user_passwords.find_by(user: user)&.editable?
  end

  def is_owner?(user)
    user_passwords.find_by(user: user)&.owner?
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(100_000_000)
    end while Password.where(id: self.id).exists?
  end
end
