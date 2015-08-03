module CodeforcesAPI
  module MethodClass
    class User
      def info *handles
        params = {'handles' => handles.join(';')}
        json_request = CodeforcesAPI.client.get('user.info', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_users = json_request['result']
          users = json_users.collect{ |user| CodeforcesAPI::Object::User.new(user) }
        end
      end

      def ratedList activeOnly = true
        params = {'activeOnly' => activeOnly}
        json_request = CodeforcesAPI.client.get('user.ratedList', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_users = json_request['result']
          users = json_users.collect{ |user| CodeforcesAPI::Object::User.new(user) }
        end
      end

      def rating handle
        params = {'handle' => handle}
        json_request = CodeforcesAPI.client.get('user.rating', params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_ratingchanges = json_request['result']
          ratingchanges = json_ratingchanges.collect{ |rc| CodeforcesAPI::Object::RatingChange.new(rc) }
        end
      end

      def status handle, optional_params
        required_params = {'handle' => handle}
        json_request = CodeforcesAPI.client.get('user.status', required_params, optional_params)
        if json_request['status'] != 'OK'
          raise json_request['result']
        else
          json_submissions = json_request['result']
          submissions = json_submissions.collect{ |sub| CodeforcesAPI::Object::Submission.new(sub) }
        end
      end
    end
  end
end
