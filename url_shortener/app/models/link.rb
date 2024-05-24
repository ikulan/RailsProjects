class Link < ApplicationRecord
  before_create :randomize_id

  scope :recent_first, -> { order(created_at: :desc) }
  
  validates :url, presence: true

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(100_000_000)
    end while Link.where(id: self.id).exists?
  end
end