module Gitfinery
  module Driver
    class LinuxFindDriver
      attr_accessor :dir

      def initialize dir = '.'
        @dir = dir
      end

      def find dir = @dir , filters = ''
        return Hash[ %x(find #{dir} #{filters})
          .split("\n")
          .map { |l| l.chomp.split(' ',2) } ]
      end

      def find_files_in dir = @dir
        find dir, '-type f'
      end
    end
  end
end
