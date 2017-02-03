require_relative '../test_base'

class TestLinuxFindDriver < TestBase
  def test_class_exisit
    assert_nothing_raised "linux find driver dosn't exists!" do
      Gitfinery::Driver::LinuxFindDriver.new
    end
  end
end
