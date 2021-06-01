class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :password_confirmation, presence: true
  
  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  end
  
  with_options presence: true do
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ } 
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ } 
  end
  
  validates :birthday, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
