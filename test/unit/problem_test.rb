# == Schema Information
#
# Table name: problems
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  state       :string(255)     default("existing")
#

require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
