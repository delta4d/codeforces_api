module CodeforcesAPI
  class Client
    attr_accessor :key, :secret

    def initialize options = {}
      options.each{ |k, v| instance_variable_set(:"@#{k}", v) }
    end
  end
end
