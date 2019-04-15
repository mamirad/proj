class Adminteacher < ApplicationRecord
   has_many :federal_cource_teachers
   has_many :federal_cources, through: :federal_cource_teachers

   has_many :punjab_cource_teachers
   has_many :punjab_cources, through: :punjab_cource_teachers
  


    validates :teacher_name, presence: true
    #validates :federal_cource_ids, presence: true
      validates :teacher_email, uniqueness: true
       validates :teacher_email, presence: true
end
