class Form < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true

	belongs_to :user

	mount_uploader :asset, AssetUploader
end