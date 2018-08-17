files = %x(git  --git-dir=test/driver/resource/git_mock/.git/ log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10
).split("\n")

targets = []

files.each do |f|
  target = f.split(" ")
  target = { name: target[1], total_change: target[0] }
  targets << target
end

targets.each do |t|
  p "-#{t[:name]}  commit: #{t[:total_change]}" unless t[:name].nil?
end
