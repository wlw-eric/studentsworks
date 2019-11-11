class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.references :speaker, foreign_key: {to_table: 'users'}
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
