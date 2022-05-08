class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name, null: false
      t.references :classification, null: false, type: :bigint, foreign_key: true
      t.boolean :limited, null: false, default: false
      t.string :url
      t.string :note
      t.integer :n_1_1, null: false, limit: 1, default: 0
      t.integer :n_1_2, null: false, limit: 1, default: 0
      t.integer :n_1_3, null: false, limit: 1, default: 0
      t.integer :n_1_4, null: false, limit: 1, default: 0
      t.integer :n_1_5, null: false, limit: 1, default: 0
      t.integer :n_1_6, null: false, limit: 1, default: 0
      t.integer :n_2_1, null: false, limit: 1, default: 0
      t.integer :n_2_2, null: false, limit: 1, default: 0
      t.integer :n_2_3, null: false, limit: 1, default: 0
      t.integer :n_2_4, null: false, limit: 1, default: 0
      t.integer :n_2_5, null: false, limit: 1, default: 0
      t.integer :n_3_1, null: false, limit: 1, default: 0
      t.integer :n_3_2, null: false, limit: 1, default: 0
      t.integer :n_3_3, null: false, limit: 1, default: 0
      t.integer :n_3_4, null: false, limit: 1, default: 0
      t.integer :n_3_5, null: false, limit: 1, default: 0
      t.integer :n_4_1, null: false, limit: 1, default: 0
      t.integer :n_4_2, null: false, limit: 1, default: 0
      t.integer :n_4_3, null: false, limit: 1, default: 0
      t.integer :n_4_4, null: false, limit: 1, default: 0
      t.integer :n_4_5, null: false, limit: 1, default: 0
      t.integer :n_5_1, null: false, limit: 1, default: 0
      t.integer :n_5_2, null: false, limit: 1, default: 0
      t.integer :n_5_3, null: false, limit: 1, default: 0
      t.integer :n_5_4, null: false, limit: 1, default: 0
      t.integer :n_5_5, null: false, limit: 1, default: 0
      t.integer :n_6_1, null: false, limit: 1, default: 0
      t.integer :n_6_2, null: false, limit: 1, default: 0
      t.integer :n_6_3, null: false, limit: 1, default: 0
      t.integer :n_6_4, null: false, limit: 1, default: 0
      t.integer :n_6_5, null: false, limit: 1, default: 0
      t.integer :n_7_1, null: false, limit: 1, default: 0
      t.integer :n_7_2_1, null: false, limit: 1, default: 0
      t.integer :n_7_2_2, null: false, limit: 1, default: 0
      t.integer :n_7_3_1, null: false, limit: 1, default: 0
      t.integer :n_7_3_2, null: false, limit: 1, default: 0
      t.integer :n_7_4, null: false, limit: 1, default: 0
      t.timestamps null: false, default: -> { 'NOW()' }
    end

    reversible do |dir|
      dir.up do
        # CHECK制約を追加
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_1_1 CHECK (0 <= n_1_1 AND n_1_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_1_2 CHECK (0 <= n_1_2 AND n_1_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_1_3 CHECK (0 <= n_1_3 AND n_1_3 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_1_4 CHECK (0 <= n_1_4 AND n_1_4 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_1_5 CHECK (0 <= n_1_5 AND n_1_5 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_1_6 CHECK (0 <= n_1_6 AND n_1_6 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_2_1 CHECK (0 <= n_2_1 AND n_2_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_2_2 CHECK (0 <= n_2_2 AND n_2_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_2_3 CHECK (0 <= n_2_3 AND n_2_3 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_2_4 CHECK (0 <= n_2_4 AND n_2_4 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_2_5 CHECK (0 <= n_2_5 AND n_2_5 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_3_1 CHECK (0 <= n_3_1 AND n_3_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_3_2 CHECK (0 <= n_3_2 AND n_3_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_3_3 CHECK (0 <= n_3_3 AND n_3_3 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_3_4 CHECK (0 <= n_3_4 AND n_3_4 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_3_5 CHECK (0 <= n_3_5 AND n_3_5 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_4_1 CHECK (0 <= n_4_1 AND n_4_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_4_2 CHECK (0 <= n_4_2 AND n_4_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_4_3 CHECK (0 <= n_4_3 AND n_4_3 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_4_4 CHECK (0 <= n_4_4 AND n_4_4 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_4_5 CHECK (0 <= n_4_5 AND n_4_5 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_5_1 CHECK (0 <= n_5_1 AND n_5_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_5_2 CHECK (0 <= n_5_2 AND n_5_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_5_3 CHECK (0 <= n_5_3 AND n_5_3 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_5_4 CHECK (0 <= n_5_4 AND n_5_4 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_5_5 CHECK (0 <= n_5_5 AND n_5_5 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_6_1 CHECK (0 <= n_6_1 AND n_6_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_6_2 CHECK (0 <= n_6_2 AND n_6_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_6_3 CHECK (0 <= n_6_3 AND n_6_3 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_6_4 CHECK (0 <= n_6_4 AND n_6_4 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_6_5 CHECK (0 <= n_6_5 AND n_6_5 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_7_1 CHECK (0 <= n_7_1 AND n_7_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_7_2_1 CHECK (0 <= n_7_2_1 AND n_7_2_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_7_2_2 CHECK (0 <= n_7_2_2 AND n_7_2_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_7_3_1 CHECK (0 <= n_7_3_1 AND n_7_3_1 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_7_3_2 CHECK (0 <= n_7_3_2 AND n_7_3_2 <= 99);'
        execute 'ALTER TABLE missions ADD CONSTRAINT check_missions_n_7_4 CHECK (0 <= n_7_4 AND n_7_4 <= 99);'
      end

      dir.down do
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_1_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_1_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_1_3;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_1_4;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_1_5;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_1_6;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_2_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_2_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_2_3;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_2_4;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_2_5;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_3_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_3_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_3_3;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_3_4;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_3_5;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_4_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_4_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_4_3;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_4_4;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_4_5;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_5_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_5_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_5_3;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_5_4;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_5_5;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_6_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_6_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_6_3;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_6_4;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_6_5;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_7_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_7_2_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_7_2_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_7_3_1;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_7_3_2;'
        execute 'ALTER TABLE missions DROP CONSTRAINT check_missions_n_7_4;'
      end
    end
  end
end
