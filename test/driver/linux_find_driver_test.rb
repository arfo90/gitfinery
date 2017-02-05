require_relative '../test_base'

class TestLinuxFindDriver < TestBase
  def setup
    @resource_dir = "#{Dir.pwd}/test/driver/resource"
  end
  

  def test_class_exisit
    assert_nothing_raised "linux find driver dosn't exists!" do
      Gitfinery::Driver::LinuxFindDriver.new
    end
  end

  def test_class_constructor_accepts_dir
    assert_nothing_raised "linux find driver should accept dir as constructor param!" do
      Gitfinery::Driver::LinuxFindDriver.new @resource_dir
    end
  end

  def test_call_find_method
    assert_nothing_raised "Cannot call method find!" do
      Gitfinery::Driver::LinuxFindDriver.new.find
    end
  end

  def test_call_find_retruns_all_files_in_resource_folder
    files = Gitfinery::Driver::LinuxFindDriver.new.find(@resource_dir)

    assert_equal(4, files.count, 'The number of files returned is not match with actual one (method: find_files_in)')
  end

  def test_call_find_accepts_filters
    files = Gitfinery::Driver::LinuxFindDriver.new.find(@resource_dir, '-type f')

    assert_equal(3, files.count, 'The number of files returned is not match with actual one (method: find_files_in)')
  end

  def test_call_find_files_method
    files = Gitfinery::Driver::LinuxFindDriver.new.find_files_in(@resource_dir)

    assert_equal(3, files.count, 'The number of files returned is not match with actual one (method: find_files_in)')
  end
end
