require 'test_helper'

class FunctionaryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Functionary.new.valid?
  end
end
