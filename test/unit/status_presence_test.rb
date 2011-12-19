require 'test_helper'

class StatusPresenceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StatusPresence.new.valid?
  end
end
