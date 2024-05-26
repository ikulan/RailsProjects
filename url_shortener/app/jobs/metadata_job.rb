class MetadataJob < ApplicationJob
  def perform(id)
    link = Link.find(id)
    metadata = Metadata.retrieve_from(link.url)
    link.update(metadata.attributes)
    link.broadcast_replace_to(link)
  end
end