[![CircleCI](https://circleci.com/gh/ksylvest/analytic.svg?style=svg)](https://circleci.com/gh/ksylvest/analytic)
[![CodeClimate Maintainability](https://api.codeclimate.com/v1/badges/005074b4a948038893a9/maintainability)](https://codeclimate.com/github/ksylvest/analytic/maintainability)
[![CodeClimate Test Coverage](https://api.codeclimate.com/v1/badges/005074b4a948038893a9/test_coverage)](https://codeclimate.com/github/ksylvest/analytic/test_coverage)

# Analytic

Analytic provides visitor / session / view tracking without the need for any third-party service.

## Installation

```bash
$ bundle add analytic
$ bin/rails analytic:install:migrations
$ bin/rails db:migrate
```

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Analytic::Engine, at: '/analytic'
end
```

```ruby
# config/initializer/analytic.rb
Analytic.configure do |config|
  config.timezone = Time.find_zone('Canada/Pacific') # default is `Time.zone`
  config.ip_v4_mask = 24 # '255.255.255.255' becomes '255.255.255.0'
  config.ip_v6_mask = 48 # 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff' becomes 'ffff:ffff:ffff:0000:0000:0000:0000:0000'
end
```

## Usage

Default inline tracking is configured with:

```ruby
class ApplicationController
  include Analytic::Trackable

  before_action { analytic_track! }
end
```

Alternative job tracking is configured with:

```ruby
class ApplicationController
  include Analytic::Trackable

  before_action { analytic_enqueue_track_job! }
```

_note: a queue such as sidekiq, rescue, etc must be running to see tracking_

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
