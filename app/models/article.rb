class Article < ApplicationRecord
  has_many :article_categories, :dependent => :destroy
  has_many :categories, :through => :article_categories
end
