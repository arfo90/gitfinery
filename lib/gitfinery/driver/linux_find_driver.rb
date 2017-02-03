module Gitfinery
  module Driver
    class LinuxFindDriver
      def find dir = '.'
        return Hash[ %x(find #{dir})
          .split("\n")
          .map { |l| l.chomp.split(' ',2) } ]
      end
    end
  end
end
