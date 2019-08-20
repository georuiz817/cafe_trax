require_relative './config/environment'

use Rack::MethodOverride
use CafeController
run ApplicationController



