class CreateTableLinkpicturetag < ActiveRecord::Migration[5.1]
  def change
    create_table :linkpicturetags do |t|
      t.integer "tag_id"
      t.integer "picture_id"
    end
  end
end
