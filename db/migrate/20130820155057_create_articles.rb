class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :slug, null: false
      t.string :title
      t.text :body
      t.text :body_html

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
