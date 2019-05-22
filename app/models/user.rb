class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   attachment :profile_image
   has_many :books

   validates :name, uniqueness: { case_sensitive: :false }, length: { minimum: 2, maximum: 20 }
   validates :introduction, length: { maximum: 50 }
end
