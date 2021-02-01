class AddColumnToPrinters < ActiveRecord::Migration[6.0]
  def change
    add_column :printers, :cartrige_id, :integer
  end
end
