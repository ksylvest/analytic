# frozen_string_literal: true

threads Integer(ENV.fetch('RAILS_MAX_THREADS', 2)), Integer(ENV.fetch('RAILS_MIN_THREADS', 2))
port Integer(ENV.fetch('PORT', 3000))
environment ENV.fetch('RAILS_ENV', 'development')
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')
