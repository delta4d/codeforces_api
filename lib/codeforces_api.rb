require "codeforces_api/version"
require "codeforces_api/client"
require "codeforces_api/configuration"

module CodeforcesAPI
  class << self
    include CodeforcesAPI::Configuration

    def client
      return @client if defined?(@client)
      @client ||= CodeforcesAPI::Client.new(options)
    end

    private

    def method_missing method, *args, &block
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end
  end
end
