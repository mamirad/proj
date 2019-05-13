class StudentResult < ApplicationRecord
  belongs_to :user
  belongs_to :quizquestion
  belongs_to :user
  # has_many :quizquestions
  # has_many :qquizs,through: :quizquestions
end
