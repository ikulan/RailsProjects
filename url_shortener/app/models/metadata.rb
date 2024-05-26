require "open-uri"

class Metadata
  attr_reader :doc

  def self.retrieve_from(url)
    new(URI.open(url))
  rescue
    new
  end

  def initialize(html=nil)
    @doc = Nokogiri::HTML(html)
  end

  def attributes
    {
      title: title,
      description: description,
      preview_image: image
    }
  end

  def title
    doc.at_css("title")&.text
  end

  def description
    og_meta_content("description") || meta_content("description")
  end

  def image
    og_meta_content "image"
  end

  def og_meta_content(name)
    doc.at_css("meta[property='og:#{name}']")&.attributes&.fetch("content", nil)&.text
  end

  def meta_content(name)
    doc.at_css("meta[name='#{name}']")&.attributes&.fetch("content", nil)&.text
  end

end