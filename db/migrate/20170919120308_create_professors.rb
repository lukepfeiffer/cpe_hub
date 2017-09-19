class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :rating
      t.timestamps
    end
  end
end
