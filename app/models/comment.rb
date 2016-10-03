class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(atrey)
    if !atrey[:username].empty?
      user = User.find_or_create_by(atrey)
      self.user = user
    end
    # binding.pry

  end

end
