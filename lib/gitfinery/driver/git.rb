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

        files.map { |f|
          target = f.split(" ")
          { name: target[1], total_change: target[0] } unless target[1].nil?
        }.compact
      end

      def commits_totalize
        %x(git --git-dir=#{@dir}/.git/  rev-list --all --count).to_i
      end

    end
  end
end
