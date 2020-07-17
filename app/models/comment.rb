class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attr)
    self.build_user(user_attr) if !user_attr[:username].empty?
  end

end
