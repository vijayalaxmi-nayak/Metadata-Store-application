class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :asset_id
      t.string :media_type
      t.belongs_to :account
      t.timestamps
    end
  end
end
