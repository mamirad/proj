class QuestionPaper < ApplicationRecord
  has_many :qp_comments
  belongs_to :teachercourse
  has_many :question_answers, :dependent => :destroy
  accepts_nested_attributes_for :question_answers, :allow_destroy => true




  validates :name, presence: true
  # validates :question_answers_attributes, presence: true


end
