class QuestionAnswer < ApplicationRecord
  belongs_to :question_paper
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options, :allow_destroy => true

end
