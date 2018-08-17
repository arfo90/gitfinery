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

      def count_commits
        %x(git --git-dir=#{@dir}/.git/  rev-list --all --count).to_i
      end

      def authors
        authors = []
        command = %x(git --git-dir=#{@dir}/.git/  shortlog -s -n --all --no-merges).split("\n").map {|sp| sp.split("\t")}.each {|a| authors << {a[1] => a[0].to_i}}
        authors.reduce({}, :merge)
      end

      def count_files
        %x(git  --git-dir=#{@dir}/.git/ ls-files | wc -l).to_i
      end
    end
  end
end
