$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

module Gitfinery
  autoload :Analyzer, 'gitfinery/analyzer.rb'

  module Driver
    autoload :Git, 'gitfinery/driver/git.rb'
    autoload :LinuxFindDriver, 'gitfinery/driver/linux_find_driver.rb'
  end

 ## autoload classes here
end
