class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.string :name, null: false
      t.timestamps null: false, default: -> { "current_timestamp(6)" }
    end
    add_index :classifications, :name, unique: true
  end
end
