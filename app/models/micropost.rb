class Micropost < ApplicationRecord
  belongs_to :user

  scope :ordered_by_date, ->{order created_at: :desc}

  validates :user, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost_content_max_length}
end
