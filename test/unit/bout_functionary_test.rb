require 'test_helper'

class BoutFunctionaryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert BoutFunctionary.new.valid?
  end
end
