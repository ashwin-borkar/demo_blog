class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true
	validates :tags, presence: true
	has_many_attached :imagess
end

