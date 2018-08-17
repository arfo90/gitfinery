require_relative '../test_base'

class TestGit < TestBase
  def setup
    @driver = Gitfinery::Driver::Git.new("#{Dir.pwd}/test/driver/git_mock")
  end

  def test_class_exists
    assert_nothing_raised "Git driver dosn't exists!" do
      Gitfinery::Driver::Git.new
    end
  end

  def test_return_most_changed_targets
    log = @driver.most_changed
    assert_equal([{:name=>"target1", :total_change=>"4"}, {:name=>"target2", :total_change=>"1"}],log, "failed to return most changed files")
  end

  def test_return_total_number_of_commits
    assert_equal(4, @driver.count_commits, "Wrong number of commits is returns")
  end

  def test_return_commits_per_author
    authors = {"Amireza Fatemi" => 4}
    assert_equal(authors, @driver.authors, "Wrong author list returned")
  end

  def test_total_file_commited
    assert_equal(2, @driver.count_files, "Wrong count files")
  end
end





