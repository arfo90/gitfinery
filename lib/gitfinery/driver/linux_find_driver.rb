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

      def list_based_on_size dir = @dir
        return Hash[ %x(find #{dir} -type f | xargs wc -l | sort | tail)
                .split("\n")
                .map { |l| l.chomp.split(' ',2) } ]
      end
    end
  end
end
