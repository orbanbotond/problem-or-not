class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :oppinion
      t.integer :problem_id
      t.timestamps
    end
  end
end
