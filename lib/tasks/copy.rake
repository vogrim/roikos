namespace :copy do
  
  desc "Copy prod database to dev"
  task db_from_prod: :environment do
    local_db = Rails.configuration.database_configuration[Rails.env]["database"]
    #system("MYSQL_PWD=root mysql -u root -e \"DROP DATABASE #{local_db};\"")
    system("mysqldump -u #{ENV["DB_USER"]} -h #{ENV["DB_HOST"]} -p#{ENV["DB_PASSWORD"]} --opt --skip-lock-tables --single-transaction #{ENV["DB_DATABASE"]} | mysql -u root -proot #{local_db}")
  end

end
