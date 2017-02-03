$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

module Gitfinery

  module Driver
    autoload :GitDriver, 'gitfinery/driver/git_driver.rb'
    autoload :LinuxFindDriver, 'gitfinery/driver/linux_find_driver.rb'
  end
  
 ## autoload classes here
end
