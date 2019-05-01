class User < ApplicationRecord
	 enum role: {admin: 0, teacher: 1, proof_reader:2}
	 has_many :boards
	 has_many :qp_comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
