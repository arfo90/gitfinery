require_relative '../lib/gitfinery'

Bundler.require(:test)

class TestBase < Minitest::Test
  def teardown
    super
    Mocha::Mockery.instance.teardown
    Mocha::Mockery.reset_instance
  end
end

class Minitest::Test
  def assert_nothing_raised message = nil
    begin
      yield if block_given?
    rescue
      flunk message || $!
    end
  end
end
