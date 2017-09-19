require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/patients")
require("pg")

DB = PG.connect({:dbname => "schedules"})
