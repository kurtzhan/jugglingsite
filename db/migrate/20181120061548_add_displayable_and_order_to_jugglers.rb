class AddDisplayableAndOrderToJugglers < ActiveRecord::Migration[5.0]
  def change
    add_column :jugglers, :displayable, :boolean, :after => :description
    add_column :jugglers, :ordinal, :integer, :after => :displayable
  end
end
