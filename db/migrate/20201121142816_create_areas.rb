class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.integer :level, null: false, limit: 1, default: 1
      t.references :parent_area
      t.string :name, null: false, limit: 3
      t.string :column_name, limit: 7
      t.timestamps null: false, default: -> { 'NOW()' }
    end

    reversible do |dir|
      dir.up do
        # UNIQUE制約を追加
        add_index :areas, %i[level parent_area_id name], unique: true
        # CHECK制約を追加
        execute 'ALTER TABLE areas ADD CONSTRAINT check_areas_level CHECK (1 <= level AND level <= 3);'
        execute 'ALTER TABLE areas ADD CONSTRAINT check_areas_parent_area CHECK (level = 1  AND parent_area_id IS NULL OR 2 <= level  AND level <=3 AND parent_area_id IS NOT NULL);'
      end

      dir.down do
        execute 'ALTER TABLE areas DROP CONSTRAINT check_areas_level;'
        execute 'ALTER TABLE areas DROP CONSTRAINT check_areas_parent_area;'
        remove_index :areas, %i[level parent_area_id name]
      end
    end
  end
end
