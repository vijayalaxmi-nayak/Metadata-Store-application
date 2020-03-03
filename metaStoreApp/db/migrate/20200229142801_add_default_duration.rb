class AddDefaultDuration < ActiveRecord::Migration[5.2]
  def change
    execute 'alter table media alter duration set default 0;'
  end
end
