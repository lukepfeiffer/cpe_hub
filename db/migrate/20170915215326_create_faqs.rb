class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :answer
      t.text :question
      t.integer :user_id
      t.timestamps
    end
  end
end
