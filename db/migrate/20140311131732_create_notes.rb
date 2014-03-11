class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :body
      t.references :application, index: true
      t.references :recruiter, index: true

      t.timestamps
    end
  end
end
