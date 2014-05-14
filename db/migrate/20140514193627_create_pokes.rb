class CreatePokes < ActiveRecord::Migration
  def change
    create_table :pokes do |t|
      t.string :author_line
      t.string :target_username
      t.string :content
      t.boolean :is_private

      t.timestamps
    end
  end
end
