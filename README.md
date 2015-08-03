# CodeforcesAPI

a ruby wrapper of [codeforces api][cfapi].

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codeforces_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codeforces_api

## Usage

### Configuration

```ruby
CodeforcesAPI.configure do |config|
  config.key    = YOUR_API_KEY
  config.secret = YOUR_API_SECRET
end
```

once you setup the api key, all the methods are through authorization.
if you have not set up the key info, all the methods are anonymouse.

```ruby
CodeforcesAPI.reset!
```

this will clear the api key info.


### Methods

let's take me(delta\_4d) as an example

```ruby
me, tourist = CodeforcesAPI.user.info('delta_4d', 'tourist')
puts me.rank      # master
puts tourist.rank # international grandmaster
```

you can also use the `user` object

```ruby
user = CodeforcesAPI.user
first_contest = user.rating('delta_4d')[0]
puts "#{first_contest.contestName} #{first_contest.newRating}"
# Codeforces Beta Round #30 (Codeforces format) 1430
```

as you can see, the usage are pretty much the same as in the [official doc][cfapi].

## Contributing

feel free to file an issue or send a pr.



[cfapi]: http://codeforces.com/api/help
