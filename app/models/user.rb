class User < ApplicationRecord
	 enum role: {federal: 0, punjab: 1, admin: 2, teacher: 3}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
