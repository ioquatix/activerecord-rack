
require 'rack/test'

require 'active_record'
require 'active_record/rack'

describe ActiveRecord::Rack do
	include Rack::Test::Methods
	
	let(:app) {Rack::Builder.parse_file(File.expand_path('config.ru', __dir__)).first}
	
	it "it should free ActiveRecord connections" do
		expect(ActiveRecord::Base.connection_handler).to_not be_active_connections
		
		get "/"
		
		expect(last_response).to be_ok
		expect(ActiveRecord::Base.connection_handler).to_not be_active_connections
	end
end
