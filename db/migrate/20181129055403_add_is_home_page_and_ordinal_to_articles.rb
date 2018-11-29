class AddIsHomePageAndOrdinalToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :is_home_page, :boolean, :after => :title
    add_column :articles, :ordinal, :integer, :after => :is_home_page
  end
end
