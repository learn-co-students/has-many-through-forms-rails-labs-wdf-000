class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :empty_username?

  def empty_username?(user_attr)
    user_attr[:username].empty?
  end
end
