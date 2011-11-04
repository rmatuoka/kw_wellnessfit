require 'test_helper'

class BoutTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bout.new.valid?
  end
end
