module CodeforcesAPI
  module Configure
    class << self
      ATTRS = [:key, :secret].freeze

      attr_accessor *ATTRS

      def configure
        yield self
      end

      def options
        ATTRS.collect{ |attr| [attr, instance_variable_get(:"@#{attr}")] }.to_h
      end
    end
  end
end
