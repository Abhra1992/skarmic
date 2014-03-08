class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :application, index: true
      t.references :messager, polymorphic: true, index: true
      t.text :body

      t.timestamps
    end
  end
end
