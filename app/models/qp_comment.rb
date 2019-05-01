class QpComment < ApplicationRecord
  belongs_to :question_paper
  belongs_to :user
end
