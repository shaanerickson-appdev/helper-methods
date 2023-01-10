class CreateTheaters < ActiveRecord::Migration[6.1]
  def change
    create_table :theaters do |t|
      t.string :name
      t.integer :capacity
      t.integer :screens

      t.timestamps
    end
  end
end
