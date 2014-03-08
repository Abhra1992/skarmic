class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.text :about
      t.string :city
      t.string :avatar

      t.timestamps
    end
  end
end
