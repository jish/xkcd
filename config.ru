$LOAD_PATH.unshift('lib')
require 'xkcd'
require 'rack/ssl-enforcer'

use Rack::SslEnforcer, except_hosts: /localhost/
run Xkcd
