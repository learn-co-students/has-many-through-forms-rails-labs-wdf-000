class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    # binding.pry
    if !category_attributes.values[0][:name].empty?
      category_attributes.values.each do |cat|
        # binding.pry
        category = Category.find_or_create_by(name: cat[:name])
        self.categories << category
      end
    end
  end


end
