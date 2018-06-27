require_relative '../test_base'

class TestGit < TestBase
  def setup
    p "Git driver tests"
  end

  def test_class_exists
    assert_nothing_raised "Git driver dosn't exists!" do
      Gitfinery::Driver::Git.new
    end
  end
end

