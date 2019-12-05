class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :content
      t.boolean :published
      t.belongs_to :admin, index: true, foreign_key: true
      t.timestamps
    end
  end
end
