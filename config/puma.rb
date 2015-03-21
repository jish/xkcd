num_workers = Integer(ENV['WEB_CONCURRENCY'] || 4)
min_threads = Integer(ENV['MIN_THREADS'] || 4)
max_threads = Integer(ENV['MAX_THREADS'] || 16)

threads min_threads, max_threads
workers num_workers

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
