module CodeforcesAPI
  module Object
    class RanklistRow
      ATTRS = [
        :party,
        :rank,
        :points,
        :penalty,
        :successfulHackCount,
        :unsuccessfulHackCount,
        :problemResults,
        :lastSubmissionTimeSeconds,
      ].freeze

      attr_reader *ATTRS

      def initialize ranklist_row
        ATTRS.each { |attr| instance_variable_set("@#{attr}", ranklist_row[attr.to_s]) }
        @party = Party.new(@party) if @party
        @problemResults = @problemResults.map { |pr| ProblemResult.new(pr) } if @problemResults
      end
    end
  end
end

