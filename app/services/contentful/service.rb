module Contentful
  class Service
    def call
      begin
        process
      rescue HTTP::ConnectionError, Contentful::Error => e
        # TODO push exception to error tracker
        Rails.logger.error(e.message)

        @default_value
      end
    end

    protected

    def process; end

    def contentful_client
      Contentful::Client.new(
        space: ENV['SPACE_ID'],
        access_token: ENV['ACCESS_TOKEN'],
        dynamic_entries: :auto,
        raise_for_empty_fields: false
      )
    end
  end
end
