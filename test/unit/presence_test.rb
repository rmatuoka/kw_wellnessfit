require 'test_helper'

class PresenceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Presence.new.valid?
  end
end
