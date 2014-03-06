class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :title
      t.integer :hours
      t.integer :duration
      t.text :skills_required
      t.text :skills_desired
      t.integer :compensation
      t.text :responsibilities
      t.integer :count
      t.date :available_from
      t.references :company, index: true

      t.timestamps
    end
  end
end
