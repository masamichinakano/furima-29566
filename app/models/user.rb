class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email
    validates :password
    validates :f_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} 
    validates :l_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} 
    validates :f_name_leader, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :l_name_leader,format: { with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end

end
