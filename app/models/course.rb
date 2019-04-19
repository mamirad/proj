class Course < ApplicationRecord
  belongs_to :boardgroup
  has_many :teachercourses
  has_many :teachers, through: :teachercourses

  validates :name, presence: true


  def course_attrs
     a = Course.find(id).boardgroup.board.name
    b = Course.find(id).boardgroup.group.name

    "#{name}---#{a}--- #{b}"
  end

end
