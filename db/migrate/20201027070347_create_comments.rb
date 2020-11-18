class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      # t.integer :event_id
      t.references :event, null: false, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
