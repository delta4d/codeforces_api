module CodeforcesAPI
  module Object
    class Submission
      ATTRS = [
        :id,
        :contestId,
        :creationTimeSeconds,
        :relativeTimeSeconds,
        :problem,
        :author,
        :programmingLanguage,
        :verdict,
        :testset,
        :passedTestCount,
        :timeConsumedMillis,
        :memoryConsumedBytes,
      ].freeze

      attr_reader *ATTRS

      def initialize sub
        ATTRS.each { |attr| instance_variable_set("@#{attr}", sub[attr.to_s]) }
        @problem = Problem.new(@problem) if @problem
        @author = Party.new(@author) if @author
      end
    end
  end
end
