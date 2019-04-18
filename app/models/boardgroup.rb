class Boardgroup < ApplicationRecord
  belongs_to :group
  belongs_to :board

  has_many :courses


  validate :unique_board_group

  private

  def unique_board_group

    @result = Boardgroup.where(['board_id=? and group_id=?', self.board_id, self.group_id]).any?

    if @result
      errors.add(:group_id, ' group and board already exist')


    end

  end

  def board_groups_attr
    a = Boardgroup.find(id).board.name
    b = Boardgroup.find(id).group.name

    "#{a}------ #{b}"
  end


end
