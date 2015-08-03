module CodeforcesAPI
  module Object
    class RatingChange
      ATTRS = [
        :contestId,
        :contestName,
        :rank,
        :ratingUpdateTimeSeconds,
        :oldRating,
        :newRating,
      ].freeze

      attr_reader *ATTRS

      def initialize rate
        ATTRS.each { |attr| instance_variable_set("@#{attr}", rate[attr.to_s]) }
      end
    end
  end
end
