require 'git'
require 'logger'

working_dir = './resources/'

g = Git.open(working_dir, :log => Logger.new(STDOUT))
#
# p g.log
# g.log.each {|l| p l.author}

# a = system ('git log')
a = %x(git log)

p a
