module CodeforcesAPI
  module Object
    class ProblemResult
      ATTRS = [
        :points,
        :penalty,
        :rejectedAttemptCount,
        :type,
        :bestSubmissionTimeSeconds,
      ].freeze

      attr_reader *ATTRS

      def initialize problem_result
        ATTRS.each { |attr| instance_variable_set("@#{attr}", problem_result[attr.to_s]) }
      end
    end
  end
end
