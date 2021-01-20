class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_one_attached :images
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }, presence: true
  validates :password, :presence => true, :on => :update,
  :if => lambda{ !password.nil? }
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  # validates_format_of :image, :with => %r{\.(png|jpg|jpeg)$}i, :message => "whatever"
  validates :image, format: {with: /\.(png|jpg)\Z/i}
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"



  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   enum gender: [:unknown, :male, :female]
   def self.genders_for_select
	  genders.keys.map{ |x| [x.humanize, x] }
	end
end
