class FriendshipDecorator < Draper::Decorator

  delegate_all
  decorates_association :member
  decorates_association :target

end
