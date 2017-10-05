class AddFilepickerUrlToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :filepicker_url, :text
  end
end
