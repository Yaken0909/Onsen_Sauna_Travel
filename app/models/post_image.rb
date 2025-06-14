class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      if File.exist?(file_path)
        image.attach(
          io: File.open(file_path),
          filename: 'no_image.jpg',
          content_type: 'image/jpeg'       )
      end
    end
    image
  end
end