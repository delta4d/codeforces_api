module CodeforcesAPI
  module MethodClass
    class ProblemSet
      def problems *tags
        params = {'tags' => tags.join(';')}
        json_request = CodeforcesAPI.client.get('problemset.problems', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_result = json_request['result']
          json_problems = json_result['problems']
          json_problemstatistics = json_result['problemStatistics']

          {
            'problems' => json_problems.collect{ |p| CodeforcesAPI::Object::Problem.new(p) },
            'problemStatistics' => json_problemstatistics.collect{ |ps| CodeforcesAPI::Object::ProblemStatistics.new(ps) },
          }
        end
      end

      def recentStatus count
        params = {'count' => count}
        json_request = CodeforcesAPI.client.get('problemset.recentStatus', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_sumbissions = json_request['result']
          submissions = json_sumbissions.collect{ |sub| CodeforcesAPI::Object::Submission.new(sub) }
        end
      end
    end
  end
end
