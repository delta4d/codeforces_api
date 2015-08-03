require 'json'
require 'net/http'
require 'digest/sha2'

require File.expand_path('../client/user',       __FILE__)
require File.expand_path('../client/helper',     __FILE__)
require File.expand_path('../configuration',     __FILE__)
require File.expand_path('../client/contest',    __FILE__)
require File.expand_path('../client/problemset', __FILE__)

require File.expand_path('../object/user',               __FILE__)
require File.expand_path('../object/hack',               __FILE__)
require File.expand_path('../object/party',              __FILE__)
require File.expand_path('../object/member',             __FILE__)
require File.expand_path('../object/contest',            __FILE__)
require File.expand_path('../object/problem',            __FILE__)
require File.expand_path('../object/submission',         __FILE__)
require File.expand_path('../object/ranklist_row',       __FILE__)
require File.expand_path('../object/rating_change',      __FILE__)
require File.expand_path('../object/problem_result',     __FILE__)
require File.expand_path('../object/problem_statistics', __FILE__)

module CodeforcesAPI
  class Client
    include CodeforcesAPI::Configuration

    def initialize options = {}
      options.each{ |k, v| instance_variable_set(:"@#{k}", v) }
    end

    def user
      @user ||= CodeforcesAPI::MethodClass::User.new
    end

    def contest
      @contest ||= CodeforcesAPI::MethodClass::Contest.new
    end

    def problemset
      @problemset ||= CodeforcesAPI::MethodClass::ProblemSet.new
    end
  end
end
