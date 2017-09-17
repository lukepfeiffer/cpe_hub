class AddDescPreviewToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :desc_preview, :string
  end
end
