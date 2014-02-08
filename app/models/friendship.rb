class Friendship < ActiveRecord::Base

  belongs_to :member
  belongs_to :target, class_name: 'Member', inverse_of: :inverse_friendships

  validates_presence_of :member
  validates_presence_of :target
  validate :different_member_and_target


  #=============================================================================
    protected
  #=============================================================================


  def different_member_and_target
    errors[:target] << 'members are the same' if member == target
  end

end
