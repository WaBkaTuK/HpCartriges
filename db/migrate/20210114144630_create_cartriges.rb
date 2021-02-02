class CreateCartriges < ActiveRecord::Migration[6.0]
  def change
    create_table :cartriges do |t|
      t.string :title
      t.text :description
      t.string :color
      t.integer :resource


    end
  end
end
