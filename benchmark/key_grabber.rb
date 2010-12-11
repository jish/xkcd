require 'benchmark'

require 'rubygems'
require 'nokogiri'

def grab_with_regex(text)
  text.match(/Permanent link to this comic: http:\/\/xkcd.com\/(\d+)\//)[1]
end

def grab_with_nokogiri(text)
  document = Nokogiri::HTML::Document.parse(text)
  document.at_css("h3:nth-child(11)").text.delete('^0-9')
end

test_files = File.expand_path('../../spec/fixtures/files', __FILE__)
homepage = File.read(File.join(test_files, '2010.12.11_xkcd_homepage.html'))

raise "Invalid key" unless grab_with_regex(homepage) == '832'
raise "Invalid key" unless grab_with_nokogiri(homepage) == '832'

Benchmark.bm(13) do |x|
  [1, 10, 100, 1000].each do |n|
    x.report("regex #{n}") do
      n.times { key = grab_with_regex(homepage) }
    end
  end
end

Benchmark.bm(13) do |x|
  [1, 10, 100, 1000].each do |n|
    x.report("nokogiri #{n}") do
      n.times { key = grab_with_nokogiri(homepage) }
    end
  end
end
