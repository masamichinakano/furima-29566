class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email, format: { with: /\A\S+@\S+\.\S+\z/}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i}
    validates :f_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :l_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :f_name_leader, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :l_name_leader, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
