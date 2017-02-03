require 'git'
require 'logger'

working_dir = './resources/'

g = Git.open(working_dir, :log => Logger.new(STDOUT))
#
# p g.log
# g.log.each {|l| p l.author}

# a = system ('git log')
a = %x(git --git-dir ./resources/.git log).split('commit')

a.each do |commit|
  # commit.split[/Author:(.*?)Date/, 1]
end

dir = '.'
b = Hash[ %x(find #{dir} -type f | xargs wc -l | sort | tail)
  .split("\n")
  .map { |l| l.chomp.split(' ',2) } ]
# b = Hash[b.map { |l| l.chomp.split(' ',2) }]
b.each do |files|
  #  puts files
   # puts ' '
  # commit.split[/Author:(.*?)Date/, 1]
end

puts b

# Refrence
## Biggest files:
##  $ find src -type f | xargs wc -l | sort | tail
##  $ find src -type f | xargs cloc -by-file | head -n 20

## Most changed
##  $ git log --pretty=format: --name-only -- src | sort | uniq -c | sort -rg | head
##  $ git log --pretty=format: --name-only --after="1 year ago"  -- src | sort | uniq -c | sort -rg | head
# find -name '*.rb' ! -name 'run*'
