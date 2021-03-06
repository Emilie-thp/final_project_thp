class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :name
      t.string :status
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
