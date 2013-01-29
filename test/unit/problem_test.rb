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

describe Problem do
  describe "state" do
    it "original state should be existing" do
      p = Problem.new
      p.state.must_equal "existing"
    end

    describe "transitions" do
      it "can resolve the existing problem" do
        p = Problem.new
        p.resolve
        p.state.must_equal "resolved"
      end
      it "can reopen the resolved problem" do
        p = Problem.new
        p.reopen
        p.state.must_equal "existing"
      end
    end
  end
end
