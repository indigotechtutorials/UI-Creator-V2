class CreateUiLibraries < ActiveRecord::Migration[8.0]
  def change
    create_table :ui_libraries do |t|
      t.string :name

      t.timestamps
    end
  end
end
