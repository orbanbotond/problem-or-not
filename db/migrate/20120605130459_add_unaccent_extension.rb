class AddUnaccentExtension < ActiveRecord::Migration
  def up
    execute "create extension unaccent"
  end

  def down
    begin
      execute "drop extension unaccent"
    rescue
      Rails.logger.debug "hmm #{$!}"
    end
  end
end
