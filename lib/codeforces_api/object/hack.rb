module CodeforcesAPI
  module Object
    class Hack
      ATTRS = [
        :id,
        :creationTimeSeconds,
        :hacker,
        :defender,
        :verdict,
        :problem,
        :test,
        :judgeProtocol,
      ].freeze

      attr_reader *ATTRS

      def initialize hack
        ATTRS.each { |attr| instance_variable_set("@#{attr}", hack[attr.to_s]) }
        @hacker   = Party.new(@hacker) if @hacker
        @defender = Party.new(@defender) if @defender
        @problem  = Problem.new(@problem) if @problem
      end
    end
  end
end
