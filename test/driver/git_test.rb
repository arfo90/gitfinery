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

  def test_return_most_changed_targets
    log = Gitfinery::Driver::Git.new("#{Dir.pwd}/test/driver/git_mock").most_changed
    assert_equal([{:name=>"target1", :total_change=>"4"}, {:name=>"target2", :total_change=>"1"}],log, "failed to return most changed files")
  end
end





