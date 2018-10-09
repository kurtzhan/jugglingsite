class CreateJugglers < ActiveRecord::Migration[5.0]
  def change
    create_table :jugglers do |t|
      t.string :name
      t.string :headshot
      t.text :description

      t.timestamps
    end
  end
end
