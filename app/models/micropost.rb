class Micropost < ApplicationRecord
  belongs_to :user

  scope :ordered_by_date, ->{order created_at: :desc}

  mount_uploader :picture, PictureUploader

  validates :user, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.micropost_content_max_length}
  validate  :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, t("should_less_than_5mb")
    end
  end
end
