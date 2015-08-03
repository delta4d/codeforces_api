module CodeforcesAPI
  class Client
    API_URI = 'http://codeforces.com/api'

    def rand6
      [*0..5].collect{ rand(10) }.join
    end

    def post_form options = {}
      options.collect{ |k, v| "#{k}=#{v}" }.join('&')
    end

    def request_url method, _params
      url = "#{API_URI}/#{method}?#{post_form(_params)}"
      return url unless using_api?
      salt = rand6()
      time = Time.now.to_i
      info = {'apiKey' => @key, 'time' => time}
      params = _params.merge(info).map{|k, v| [k.to_s, v]}.sort.to_h
      digest_string = "#{salt}/#{method}?#{post_form(params)}##{@secret}"
      api_sig = Digest::SHA2.new(512).hexdigest(digest_string)
      params.merge!('apiSig'=>"#{salt}#{api_sig}")
      "#{API_URI}/#{method}?#{post_form(params)}"
    end

    def get method, required_params, optional_params = {}
      params = required_params.merge(optional_params)
      uri = URI(request_url(method, params))
      http_response = Net::HTTP.get(uri)
      json_response = JSON.parse(http_response)
    end
  end
end
