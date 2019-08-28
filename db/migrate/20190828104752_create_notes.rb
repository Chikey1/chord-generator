class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :name, null: false, uniqueness: true
      t.string :symbol, null: false, uniqueness: true
      t.integer :enharmonic_id

      t.timestamps
    end
  end
end
