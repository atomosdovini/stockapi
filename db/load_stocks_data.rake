# lib/tasks/load_stocks_data.rake
desc 'Loads data from db/stocks/MGLU3.SA.csv file to vehicles table'
task :load_stocks_data => :environment do
#   MyLogger.log('Starting to load the vehicle data from db/stocks/MGLU3.SA.csv ...')
  
    Stock.import!

#   MyLogger.log('Done loading the vehicle data from db/stocks/MGLU3.SA.csv')
end