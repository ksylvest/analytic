[![CircleCI](https://circleci.com/gh/ksylvest/analytic.svg?style=svg)](https://circleci.com/gh/ksylvest/analytic)
[![CodeClimate Maintainability](https://api.codeclimate.com/v1/badges/005074b4a948038893a9/maintainability)](https://codeclimate.com/github/ksylvest/analytic/maintainability)
[![CodeClimate Test Coverage](https://api.codeclimate.com/v1/badges/005074b4a948038893a9/test_coverage)](https://codeclimate.com/github/ksylvest/analytic/test_coverage)

# Analytic

![Demo](/demo.png)

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

## Configuration

### Authentication the Dashboard

By default **Analytic** is not authenticated. To authenticate using `Rack::Auth` generate a random username and password:

```ruby
$ bin/rails secret # generate a secret
$ bin/rails credentials:edit
```

```yaml
analytic:
  username: abc...
  password: def...
```

```ruby
# config/initializers/analytic.rb

def same?(src, dst)
  # https://api.rubyonrails.org/classes/ActiveSupport/SecurityUtils.html
  ActiveSupport::SecurityUtils.secure_compare(src, dst)
end

Analytic.configure do |config|
  unless Rails.env.local?
    config.use Rack::Auth::Basic do |username, password|
      credentials = Rails.application.credentials.analytic
      same?(username, credentials.username) && same?(password, credentials.password)
    end
  end
end
```

### Capturing Extra Parameters

By default **Analytic** tracks `utm_source`, `utm_medium`, `utm_campaign`, `utm_content`, `utm_term`, `ref` and `source` parameters for each request. This list can be customized using:

```ruby
# config/initializer/analytic.rb
Analytic.configure do |config|
  config.params << :gclid # e.g. Google
  config.params << :msclkid # e.g. Bing
end
```

### Changing the Time Zone

By default **Analytic** uses `Time.zone` - which is assignable using:

```ruby
# config/application.rb
class Application < Rails::Application
  config.time_zone = 'Canada/Pacific'
end
```

The time zone may also be specified for **Analytic** using any `ActiveSupport::TimeZone`:

```ruby
# config/initializer/analytic.rb
Analytic.configure do |config|
  config.time_zone = Time.find_zone('Canada/Pacific')
end
```

### Overriding IP Masking Rules

By default IP addresses are masked as follows:

- IPv4: limit to leading 24-bits (e.g. '255.255.255.255' becomes '255.255.255.0')
- IPv6: limit to leading 48-bits (e.g. 'ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff' becomes 'ffff:ffff:ffff:0000:0000:0000:0000:0000')

To override both an `ip_v4_mask` and `ip_v6_mask` are assignable:

```ruby
Analytic.configure do |config|
  config.ip_v4_mask = 24 # nil skips masking
  config.ip_v6_mask = 48 # nil skips masking
```

## Usage

Default inline tracking is configured with:

```ruby
class ApplicationController
  include Analytic::Trackable

  before_action :analytic_track!, if: -> { request.format.html? }
end
```

Alternative job tracking is configured with:

```ruby
class ApplicationController
  include Analytic::Trackable

  before_action :analytic_enqueue_track_job!, if: -> { request.format.html? }
end
```

_note: a queue such as sidekiq, rescue, etc must be running to see tracking_

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
