class Friendship < ActiveRecord::Base

  #= Relationships ===
  belongs_to :member
  belongs_to :target, class_name: 'Member', inverse_of: :inverse_friendships

  #= Validation ===
  validates_presence_of :member_id
  validates_presence_of :target_id
  validate :different_member_and_target
  validate :friendship_unique


  #=============================================================================
    protected
  #=============================================================================


  def different_member_and_target
    errors[:target] << 'members are the same' if member == target
  end


  def friendship_unique
    errors[:target] << 'friendship already exists' if friendship_duplicate?
  end


  def friendship_duplicate?
    self.class.where( '(
      member_id = :member AND target_id = :target
    ) OR (
      target_id = :member AND member_id = :target
    )', member: member_id, target: target_id ).any?
  end

end
