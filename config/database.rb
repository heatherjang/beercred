configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  credentials = {   adapter: 'postgresql',
    encoding: 'unicode',
    pool: 5,
    database: 'dc8f0lcnp9kvi4',
    username: 'ootypuxurllzbv',
    password: 'nXkVSWjV9jsKMzX74HUDJHns15',
    host: 'ec2-54-235-127-33.compute-1.amazonaws.com',
    port: 5432,
    min_messages: 'error' }

  puts "Establishing connection to database ..."
  ActiveRecord::Base.establish_connection( credentials )
  puts "CONNECTED"


  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
