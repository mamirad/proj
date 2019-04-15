class PunjabCource < ApplicationRecord
  belongs_to :group
  has_many :punjab_cource_teachers
   has_many :adminteachers, through: :punjab_cource_teachers
   validates_uniqueness_of :cource_name, scope: [:group_id]
     validates :cource_name, presence: true
end
