
require 'active_record'
require 'active_record/rack'

ActiveRecord::Base.configurations = {
	'development' => {
		'adapter' => 'sqlite3',
		'database' => ':memory:'
	}
}

use ActiveRecord::Rack::ConnectionManagement

run lambda { |env|
	ActiveRecord::Base.establish_connection(:development)
	
	ActiveRecord::Base.connection.data_sources
	
	[200, {}, []]
}
