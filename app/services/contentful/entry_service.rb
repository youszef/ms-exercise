module Contentful
  class EntryService < Service
    def initialize(id)
      @id = id
    end

    protected

    def process
      contentful_client.entry(@id, include: 2)
    end
  end
end
