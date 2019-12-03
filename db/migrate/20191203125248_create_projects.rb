class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.text :content
      t.date :date
      t.boolean :published

      t.timestamps
    end
  end
end
