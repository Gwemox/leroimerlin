class CreateTablePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string "picture"
      t.integer "linkpicturetags_id"
      t.integer "category_id"
      t.integer "user_id"

      t.timestamps
    end
  end
end
