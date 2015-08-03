module CodeforcesAPI
  module Object
    class Party
      ATTRS = [
        :contestId,
        :members,
        :participantType,
        :teamId,
        :teamName,
        :ghost,
        :room,
        :startTimeSeconds,
      ].freeze

      attr_reader *ATTRS

      def initialize party
        ATTRS.each { |attr| instance_variable_set("@#{attr}", party[attr.to_s]) }
        @members = @members.map{|mem| Member.new(mem)} if @members
      end
    end
  end
end
