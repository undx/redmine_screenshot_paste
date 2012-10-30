require 'base64'
class UploadedScreenshot
  def initialize(content, name)
    @raw = StringIO.new(Base64.decode64(content.to_s))
    @name = name.to_s.strip
    @name = "screenshOOt" if @name.blank?
    @name << ".png"
  end
  def size
    @raw.size
  end
  def original_filename
    @name
  end
  def content_type
    "image/png"
  end
  def read(*args)
    @raw.read(*args)
  end
end