class Qquiz < ApplicationRecord
  belongs_to :teachercourse
  has_many :quizquestions
  has_many :student_results,through: :quizquestions
  has_many :course_questions,through: :quizquestions

  # validates :expire_date, presence: true




  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past

    if self.expire_date.present? && self.expire_date < Date.today
       errors.add(:expiry_date, "Date is less then current Date")
      # errors.add(:base, "Custom error message",message: 'Date is less then current Date')
    end
  end

end
