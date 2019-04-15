class FederalCource < ApplicationRecord
  belongs_to :group
  has_many :federal_cource_mcqs
  has_many :federal_cource_teachers
  has_many :adminteachers, through: :federal_cource_teachers
 
   
   validates_uniqueness_of :cource_name, scope: [:group_id]
   validates :cource_name, presence: true
end
