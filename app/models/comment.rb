class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: :all_blank

  # 
  # def user_attributes=(attributes)
  #   user = User.find_or_create_by(attributes)
  #   self.user = user
  # end
  #
  #
  # def user_attributes
  #   if self.user
  #     self.user.username
  #
  #   end
  # end

  #
  #
  #
  #
  #
  #
  # def reject_user(attributes)
  #   attributes["username"].blank?
  # end








end
