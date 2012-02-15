require 'test_helper'

class SectorFunctionaryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SectorFunctionary.new.valid?
  end
end
