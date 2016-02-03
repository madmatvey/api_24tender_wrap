class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :time_to
      t.integer :time_from

      t.timestamps null: false
    end
  end
end
