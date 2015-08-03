module CodeforcesAPI
  module Configuration
    ATTRS = [:key, :secret, :use_api].freeze

    attr_accessor *ATTRS

    def configure
      @use_api = true
      yield self
    end

    def options
      ATTRS.collect{ |attr| [attr, instance_variable_get(:"@#{attr}")] }.to_h
    end

    def using_api?
      @use_api
    end

    def reset!
      @key        = nil
      @secret     = nil
      @use_api    = false
    end
  end
end
