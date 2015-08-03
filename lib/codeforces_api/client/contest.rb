module CodeforcesAPI
  module MethodClass
    class Contest
      def hacks contestId
        params = {'contestId' => contestId}
        json_request = CodeforcesAPI.client.get('contest.hacks', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_hacks = json_request['result']
          hacks = json_hacks.collect{ |h| CodeforcesAPI::Object::Hack.new(h) }
        end
      end

      def list gym = false
        params = {'gym' => gym}
        json_request = CodeforcesAPI.client.get('contest.list', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_contests = json_request['result']
          contests = json_contests.collect{ |c| CodeforcesAPI::Object::Contest.new(c) }
        end
      end

      def standings contestId, optional_params = {}
        required_params = {'contestId' => contestId}
        json_request = CodeforcesAPI.client.get('contest.standings', required_params, optional_params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_result = json_request['result']

          json_contest = json_result['contest']
          json_problems = json_result['problems']
          json_rows = json_result['rows']

          {
            'contest' => CodeforcesAPI::Object::Contest.new(json_contest),
            'problems' => json_problems.collect{ |p| CodeforcesAPI::Object::Problem.new(p) },
            'rows' => json_rows.collect{ |r| CodeforcesAPI::Object::RanklistRow.new(r) },
          }
        end
      end

      def status contestId, optional_params = {}
        required_params = {'contestId' => contestId}
        json_request = CodeforcesAPI.client.get('contest.status', required_params, optional_params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_submissions = json_request['result']
          submissinos = json_submissions.collect{ |sub| CodeforcesAPI::Object::Submission.new(sub) }
        end
      end
    end
  end
end
