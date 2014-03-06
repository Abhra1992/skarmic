class CreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :avatar
      t.references :company, index: true

      t.timestamps
    end
  end
end
