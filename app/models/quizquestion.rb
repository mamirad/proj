class Quizquestion < ApplicationRecord
  belongs_to :qquiz
  belongs_to :course_question
  # belongs_to :student_result
  has_many :student_results
end
