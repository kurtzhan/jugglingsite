class AddDescriptionToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :description, :text, :after => :title
  end
end
