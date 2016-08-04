class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(hash)
    self.user = User.find_or_create_by(username: hash[:username]) if !hash[:username].empty?
  end

end
