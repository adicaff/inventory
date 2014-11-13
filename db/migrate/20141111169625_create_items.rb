class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :ubication
      t.string :slug
      t.string :avatar
      t.string :qr_code
      t.integer :lock_version, default: 0

      t.timestamps
    end
    add_index :items, :slug, unique: true
  end
end