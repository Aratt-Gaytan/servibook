class AddSlugToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :slug, :string
    add_index :books, :slug, unique: true
  end
end
