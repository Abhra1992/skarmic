class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :candidate, index: true
      t.references :position, index: true
      t.integer :stage
      t.integer :rating

      t.timestamps
    end
  end
end
