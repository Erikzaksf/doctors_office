require("rspec")
require("pg")
require("doctors")
require("patients")

DB = PG.connect({:dbname => 'schedules'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end
