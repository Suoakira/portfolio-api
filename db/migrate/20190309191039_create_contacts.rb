class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :subject
      t.string :email
      t.text :context

      t.timestamps
    end
  end
end
