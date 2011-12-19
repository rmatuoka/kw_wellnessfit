require 'test_helper'

class StatusPresencesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StatusPresences.new.valid?
  end
end
