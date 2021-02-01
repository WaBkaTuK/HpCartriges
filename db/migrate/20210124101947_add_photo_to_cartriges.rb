class AddPhotoToCartriges < ActiveRecord::Migration[6.0]
  def change
    add_column :cartriges, :photo, :string
  end
end
