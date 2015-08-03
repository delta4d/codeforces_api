module CodeforcesAPI
  module Object
    class Problem
      ATTRS = [
        :contestId,
        :index,
        :name,
        :type,
        :points,
        :tags,
      ].freeze

      attr_reader *ATTRS

      def initialize prob
        ATTRS.each { |attr| instance_variable_set("@#{attr}", prob[attr.to_s]) }
      end
    end
  end
end
