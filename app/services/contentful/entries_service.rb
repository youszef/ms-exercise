module Contentful
  class EntriesService < Service
    def initialize
      @default_value = []
    end

    protected

    def process
      contentful_client.entries(content_type: 'recipe')
    end
  end
end
