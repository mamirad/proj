class Group < ApplicationRecord
  has_many :boardgroups
  has_many :boards, through: :boardgroups

  validates :name, uniqueness: true
  validates :name,:board_ids, presence: true



  

#   validates_uniqueness_of :board_id, scope: [:group_id]
# validate :unique_board_group
# private

#   def self.unique_board_group(boardid,groupid)
#     # if file_name.present? && !%w{.jpg .png .jpeg .tif}.include?(File.extname(file_name.downcase))
#     #   errors.add(:file_name, :invalid_extension)
#     # end

#  unless Boardgroup.where(['board_id=? and group_id=?',boardid,groupid]).any?

#  errors.add(:group_exist, :group_exist)
#  return 0
# else
# 	return 1

#   end

# end




end
