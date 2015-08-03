module CodeforcesAPI
  module Object
    class Contest
      ATTRS = [
        :id,
        :name,
        :type,
        :phase,
        :frozen,
        :durationSeconds,
        :startTimeSeconds,
        :relativeTimeSeconds,
        :preparedBy,
        :websiteUrl,
        :description,
        :difficulty,
        :kind,
        :icpcRegion,
        :country,
        :city,
        :season,
      ].freeze

      attr_reader *ATTRS

      def initialize contest
        ATTRS.each { |attr| instance_variable_set("@#{attr}", contest[attr.to_s]) }
      end
    end
  end
end
