require 'git'

module Gitfinery
  module Driver
    class Git
      def initialize(dir = '.')
        @dir = dir
      end

      def self.log
      end

      def most_changed
        files = %x(git --git-dir=#{@dir}/.git/ log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10
        ).split("\n")

        targets = []
        list = []

        files.each do |f|
          target = f.split(" ")
          targets << { name: target[1], total_change: target[0] } unless target[1].nil?
        end
        targets
      end
    end
  end
end
