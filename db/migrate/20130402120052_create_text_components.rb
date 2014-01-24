class CreateTextComponents < ActiveRecord::Migration
  def change
    create_table :text_components do |t|
      t.text :description
      t.references :problem, index: true

      t.timestamps
    end
  end
end
