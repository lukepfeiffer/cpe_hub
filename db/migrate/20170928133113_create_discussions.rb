class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :question
      t.integer :course_id
      t.integer :user_id
      t.text :description
      t.text :admin_notes
      t.integer :flag_count
      t.timestamps
    end
  end
end
