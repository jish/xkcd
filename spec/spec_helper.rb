
def file(filename)
  test_file_path = File.expand_path('../fixtures/files', __FILE__)
  File.read(File.join(test_file_path, filename))
end
