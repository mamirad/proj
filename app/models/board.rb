class Board < ApplicationRecord
  belongs_to :user
  has_many :boardgroups
  has_many :groups, through: :boardgroups


  validates :name, uniqueness: true
  validates :name, presence: true
end
