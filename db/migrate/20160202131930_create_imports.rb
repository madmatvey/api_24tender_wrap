class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.time :import_time
      t.integer :import_id

      t.timestamps null: false
    end
  end
end
