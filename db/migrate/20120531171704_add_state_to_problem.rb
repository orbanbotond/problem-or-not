class AddStateToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :state, :string, :default => :existing
  end
end
