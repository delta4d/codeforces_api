module CodeforcesAPI
  module Object
    class ProblemStatistics
      ATTRS = [
        :contestId,
        :index,
        :solvedCount,
      ].freeze

      attr_reader *ATTRS

      def initialize probstat
        ATTRS.each { |attr| instance_variable_set("@#{attr}", probstat[attr.to_s]) }
      end
    end
  end
end
