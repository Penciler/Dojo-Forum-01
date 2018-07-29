class Post < ApplicationRecord
	belongs_to :user
	belongs_to :catagory
	has_many :replies
	mount_uploader :image, PhotoUploader
end
