class Teachercourse < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :question_papers

end
