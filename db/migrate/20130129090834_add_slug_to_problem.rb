class AddSlugToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :slug, :string

    Problem.find_each(&:save)
  end
end
