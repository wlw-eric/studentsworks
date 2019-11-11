class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :objective
      t.integer :progress
      t.string :picture
      t.string :category
      t.references :creator, foreign_key: {to_table: 'users'}

      t.timestamps
    end
  end
end
