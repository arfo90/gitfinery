require_relative '../test_base'

class TestDriverBase < TestBase
  def test_test
    assert_nothing_raised "Git driver dosn't exists!" do
      Gitfinery::Driver::GitDriver.new
    end
  end

  def test_class_exist
  end
end
