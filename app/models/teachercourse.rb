class Teachercourse < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :course_questions

end
