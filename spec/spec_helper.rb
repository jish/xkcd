require 'webmock/rspec'

module RSpecHelpers
  def file(filename)
    test_file_path = File.expand_path('fixtures/files', __dir__)
    File.read(File.join(test_file_path, filename))
  end
  alias :read_file :file
end

RSpec.configure do |c|
  c.include RSpecHelpers
end
