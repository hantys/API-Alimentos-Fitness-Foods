class CreatePlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :key
      t.string :secret

      t.timestamps
    end

    add_index :platforms, :secret
  end
end
