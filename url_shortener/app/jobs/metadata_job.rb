class MetadataJob < ApplicationJob
  def perform(id)
    link = Link.find(id)
    metadata = Metadata.retrieve_from(link.url)
    link.update(metadata.attributes)
  end
end