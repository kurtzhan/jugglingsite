class Article < ApplicationRecord
  has_many :article_categories, :dependent => :destroy
  has_many :categories, :through => :article_categories

  scope :is_home_page, -> { where(:is_home_page => true)}
end
