class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc {|attr| attr.empty?}

  def user_attributes=(user_attributes)
    unless user_attributes[:username].empty?
      user = User.find_or_create_by(user_attributes)
      user.comments << self
      user.save 
    end
  end
end
