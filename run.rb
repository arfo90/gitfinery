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


# Refrence
## Biggest files:
##  $ find src -type f | xargs wc -l | sort | tail
##  $ find src -type f | xargs cloc -by-file | head -n 20

## Most changed
##  $ git log --pretty=format: --name-only -- src | sort | uniq -c | sort -rg | head
##  $ git log --pretty=format: --name-only --after="1 year ago"  -- src | sort | uniq -c | sort -rg | head
