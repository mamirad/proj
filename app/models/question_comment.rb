class QuestionComment < ApplicationRecord
  belongs_to :course_question
  belongs_to :user
  validates :comment, presence: true

end
