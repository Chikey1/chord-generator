class CreateNumericalChords < ActiveRecord::Migration[5.1]
  def change
    create_table :numerical_chords do |t|
      t.integer :chord_base_id, null: false
      t.text :modification_ids, null: false
      t.integer :base, null: false
      t.string :quality, null: false

      t.timestamps
    end

    add_index :numerical_chords, [:quality, :base]
    add_index :numerical_chords, :base
  end
end
