class MigrateDescriptionsIntoTextComponent < ActiveRecord::Migration
  def up
    Problem.find_each do |problem|
      problem.text_components.create description: problem.description
      problem.description = nil
      problem.save
    end
  end

  def down
    TextComponents.find_each do |component|
      component.problem.description = component.problem.description + component.description
      problem.save
    end
  end
end
