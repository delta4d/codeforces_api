module CodeforcesAPI
  module Object
    class Member
      ATTRS = [
        :handle
      ].freeze

      attr_reader *ATTRS

      def initialize mem
        ATTRS.each { |attr| instance_variable_set("@#{attr}", mem[attr.to_s]) }
      end
    end
  end
end
