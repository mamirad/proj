class User < ApplicationRecord
	 enum role: {admin: 0, teacher: 1}
	 has_many :boards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
