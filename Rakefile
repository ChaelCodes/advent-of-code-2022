require 'rspec/core/rake_task'

task :install do
	sh("bundle install")
end

task :new_day, [:day] do |t, args|
	filename = sprintf("day_%02d", args[:day])
	class_name = sprintf("Day%02d", args[:day])

	FileUtils.touch("./inputs/#{filename}.txt")
	File.write("./solutions/#{filename}.rb", File.read("./solutions/day_00.rb").gsub('Day00', class_name))
	File.write("./spec/#{filename}_spec.rb", File.read("./spec/day_00_spec.rb").gsub('Day00', class_name))
end

RSpec::Core::RakeTask.new(:spec) do |t|
	t.rspec_opts = "--format documentation"
end
