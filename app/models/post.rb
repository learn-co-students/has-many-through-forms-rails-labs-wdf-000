class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  has_many :commenters, through: :comments, source: :user
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attributes|
      category = Category.find_or_create_by(category_attributes)
      self.post_categories.build(category: category)
    end
  end

  def uniq_commenters
    commenters.uniq
  end

end
