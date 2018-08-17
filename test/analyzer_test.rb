require_relative 'test_base'

class TestAnalyzer < TestBase
  def test_class_exisits
    Gitfinery::Analyzer.new
  end
end
