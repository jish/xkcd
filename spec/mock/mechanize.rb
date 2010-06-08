
class Mechanize

  def get(uri)
    spec_dir = ::File.join(::File.dirname(__FILE__), '..')
    source   = ::File.read(::File.join(spec_dir, 'files', 'homepage.html'))
    Page.new(source)
  end

end
