#!/usr/bin/env ruby
#
# Run a local server to view local documentation.
#

if !system("which", "asdf", out: "/dev/null")
  abort("Please install the asdf gem")
end

system("rake", "rdoc")
Dir.chdir("doc")
exec("asdf")
