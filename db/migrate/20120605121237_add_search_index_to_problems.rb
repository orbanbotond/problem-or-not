class AddSearchIndexToProblems < ActiveRecord::Migration
  def up
    execute "create index problem_title on problems using gin(to_tsvector('english', title))"
    execute "create index problem_description on problems using gin(to_tsvector('english', description))"
  end

  def down
    begin
     # execute "drop index problem_title"
     # execute "drop index problem_description"
    rescue
      Rails.logger.debug "hmm #{$!}"
    end
  end
end
