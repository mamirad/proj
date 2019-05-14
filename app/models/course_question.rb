class CourseQuestion < ApplicationRecord
  belongs_to :teachercourse
  validates :question, presence: true
  # validates :answer, presence: true

  has_many :question_comments







  def name_of_method

    a = CourseQuestion.find(id)

    "#{a}------ "
  end








end
