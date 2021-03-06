class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.string :address
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
