class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_one_attached :image
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   enum gender: [:unknown, :male, :female]
   def self.genders_for_select
	  genders.keys.map{ |x| [x.humanize, x] }
	end
end
