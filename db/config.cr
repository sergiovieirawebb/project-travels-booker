require "jennifer"
require "jennifer/adapter/mysql"

Jennifer::Config.configure do |conf|
  conf.host = "db"
  conf.user = "root"
  conf.password = "1234567"
  conf.adapter = "mysql"
  conf.db = "travels_booker"
  conf.migration_files_path = "./db/migrations"
end
