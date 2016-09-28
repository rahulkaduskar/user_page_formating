class CreateStylesheets < ActiveRecord::Migration
  def change
    create_table :stylesheets do |t|
      t.string :family
      t.integer :size
      t.string :color
      t.string :custom
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
