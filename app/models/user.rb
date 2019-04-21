class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#Userモデルとbooksを関連付け
  has_many :books, dependent: :destroy
  #refile使う時はattachment
  attachment :profile_image
end