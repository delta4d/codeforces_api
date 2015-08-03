module CodeforcesAPI
  module Object
    class User
      ATTRS = [
        :handle,
        :email,
        :vkId,
        :openId,
        :firstName,
        :lastName,
        :country,
        :city,
        :organization,
        :contribution,
        :rank,
        :rating,
        :maxRank,
        :maxRating,
        :lastOnlineTimeSeconds,
        :registrationTimeSeconds
      ].freeze

      attr_reader *ATTRS

      def initialize user
        ATTRS.each { |attr| instance_variable_set("@#{attr}", user[attr.to_s]) }
      end
    end
  end
end

