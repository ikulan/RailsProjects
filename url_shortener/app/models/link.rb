class Link < ApplicationRecord
  before_create :randomize_id

  has_many :views, dependent: :destroy
  
  scope :recent_first, -> { order(created_at: :desc) }
  
  validates :url, presence: true

  after_save_commit if: :url_previously_changed? do
    MetadataJob.perform_later(to_param)
  end

  def self.find(id)
    super Base62.decode(id)
  end

  def to_param
    Base62.encode(id)
  end

  def domain
    URI(url).host rescue URI::InvalidURIError
  end

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(100_000_000)
    end while Link.where(id: self.id).exists?
  end
end