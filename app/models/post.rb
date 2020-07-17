class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(hash)
    hash.each do |k, v|
      cat = Category.find_or_create_by(name: v[:name]) if !v[:name].empty?
      self.categories << cat if cat
    end
  end

  def category_ids=(array)
    array.each do |id|
      cat = Category.find(id) if !id.empty?
      self.categories << cat if cat
    end
  end

  def get_commenters
    self.comments.map{|comment| comment.user}.uniq
  end


end
