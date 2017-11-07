class CreateTableCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :table_categories do |t|
      t.string "name"
    end
  end
end
