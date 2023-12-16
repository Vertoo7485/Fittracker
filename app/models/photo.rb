class Photo < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :images, length: { minimum:4, maximum: 4}

  validate :images_content_type
  
  private
  
  def images_content_type
    images.each do |image|
      if !image.content_type.in?(%w(image/jpeg image/png image/jpg))
        errors.add(:images, I18n.t('errors.messages.invalid_image_type'))
        break
      end
    end
  end
end
