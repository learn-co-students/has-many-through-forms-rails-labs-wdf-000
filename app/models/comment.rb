class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attr)
    if !attr[:username].empty?
      self.build_user(attr)
    end
  end

end
