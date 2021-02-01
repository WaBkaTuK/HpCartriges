class AddPhotoToPrinters < ActiveRecord::Migration[6.0]
  def change
    add_column :printers, :photo, :string
  end
end
