class UserPassword < ApplicationRecord
  # Viewer can only view the password
  # Owner view, edit, and share the password
  ROLES = %w{owner viewer}
  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclusion: {in: ROLES}

  attribute :role, default: :viewer

  def owner?
    role == "owner"
  end

  def viewer?
    role == "viewer"
  end

  def editable?
    owner?
  end
end
