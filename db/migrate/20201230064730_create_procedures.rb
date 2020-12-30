class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures, id: :uuid do |t|
      t.string :name, null: false
      t.index :name, opclass: :gin_trgm_ops, using: :gin
      t.timestamps
    end
  end
end
