require 'rake/clean'

task :default do
  system("rake", "--tasks")
end

desc "Generate RDoc documentation"
task :rdoc do
  sh("rdoc", "--main", "docs/index.md", "docs", "lib")
end

CLOBBER.include("doc")

begin
  require 'rspec/core/rake_task'

  desc "Run RSpec"
  RSpec::Core::RakeTask.new(:spec)

  desc "Run the test suite"
  task :test => :spec
rescue LoadError
end
