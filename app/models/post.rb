class Post < ApplicationRecord
	has_many :comments, dependent: :destroy 
	validates :title, presence: true
	validates :description, presence: true
	validates :tags, presence: true
	has_one_attached :images
end

