require "bundler/setup"

require "sinatra/activerecord"

require_relative '../app/models/character.rb'
require_relative '../app/models/show.rb'
require_relative '../app/models/actor.rb'
require_relative '../app/models/network.rb'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS actors (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
  )
SQL

ActiveRecord::Base.connection.execute(sql)

sql2 = <<-SQL
  CREATE TABLE IF NOT EXISTS characters (
  id INTEGER PRIMARY KEY,
  name TEXT,
  actor_id INTEGER,
  show_id INTEGER
  )
SQL

ActiveRecord::Base.connection.execute(sql2)
