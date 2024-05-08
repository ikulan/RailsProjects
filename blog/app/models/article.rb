class Article < ApplicationRecord
  include Visible

  has_rich_text :content
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, -> { order(published_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
