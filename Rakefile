
task :default do
  system("rake", "-T")
end

begin
  require 'rspec/core/rake_task'

  desc "Run RSpec"
  RSpec::Core::RakeTask.new(:spec)

  desc "Run the test suite"
  task :test => :spec
rescue LoadError
end

