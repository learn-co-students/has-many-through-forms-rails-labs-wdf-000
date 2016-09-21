class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      #category_attributes.each do |index, category_attribute|
      # if category_attributes[:name].present?
        category = Category.find_or_create_by(category_attribute)
        # if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        # ^^^ instantiating an instance of the join model and putting the category in
        # self.categories << category -- inefficient
        # end
      # end
    end
  end


  def unique_commenters
    array = []
    array << self.users.unique
    array
    # binding.pry
  end

end


#
# Users who have commented on this post:
# <ul>
# <% @post.unique_commenters.each do |commenter| %>
#   <li><%= link_to commenter.username, user_path(commenter) %></li>
# <% end %>
# </ul>
