module Gitfinery
  module Driver
    class Manager
      def load(driver_request, config = '')
        driver = self.builder(driver_request)
      end

      def builder(driver)
        case driver
        when :git
          Gitfinery::Driver::Git.new
        when :LinuxFind
          Gitfinery::Driver::LinuxFindDriver.new
        else
          nil
        end
      end
    end
  end
end
