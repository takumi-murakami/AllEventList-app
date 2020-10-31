class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :visitor, foreign_key:{ to_table: :users }
      t.references :visited, foreign_key:{ to_table: :users }
      t.references :event, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :action
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end
