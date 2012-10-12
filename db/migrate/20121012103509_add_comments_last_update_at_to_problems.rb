class AddCommentsLastUpdateAtToProblems < ActiveRecord::Migration
  def down
    remove_column :problems, :comments_last_updated_at
  end

  def up
    add_column :problems, :comments_last_updated_at,  :datetime

    Problem.all.each do |problem|
        problem.comments_last_updated_at = problem.latest_comment.updated_at rescue problem.comments_last_updated_at = problem.updated_at
      problem.save
    end
  end
end
