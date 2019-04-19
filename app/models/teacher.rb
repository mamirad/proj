class Teacher < ApplicationRecord
  has_many :teachercourses
  has_many :courses, through: :teachercourses

  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :phone, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :course_ids, presence: true



end
