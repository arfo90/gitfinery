module Gitfinery
  module Driver
    class LinuxFindDriver
      def find dir = '.', filters = ''
        return Hash[ %x(find #{dir} #{filters})
          .split("\n")
          .map { |l| l.chomp.split(' ',2) } ]
      end

      def find_files_in dir
        find dir, '-type f'
      end
    end
  end
end
