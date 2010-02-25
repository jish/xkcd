class TextGrabber

  TEXT_MAP = {
    '705' => "The weird sense of duty really good sysadmins have can border on the sociopathic, but it's nice to know that it stands between the forces of darkness and your cat blog's servers."
  }

  def self.grab(id)
    TEXT_MAP[id.to_s]
  end

end
