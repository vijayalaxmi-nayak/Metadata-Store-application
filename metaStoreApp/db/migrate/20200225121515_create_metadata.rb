class CreateMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata do |t|
      t.string :asset_id_meta
      t.string :title
      t.integer :duration
      t.string :location
      t.datetime :recorded_time
      t.string :timecode
      t.timestamps
    end
  end
end
