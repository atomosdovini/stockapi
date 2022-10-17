# lib/tasks/active_record_copy.rake
require 'csv'
require "benchmark"
namespace :copy do
   desc "imports data from csv to postgresql"
   task :data => :environment do
       def insert_user
           users = []
           CSV.foreach(filename, headers: true) do |row|
               users << row
           end
           time = Time.now.getutc
          
           User.copy_from_client [:first_name, :last_name, :email, :created_at, :updated_at] do |copy|
               users.each do |d|
                   copy << [d[:first_name], d[:last_name], d[:email] ,time, time ]
               end
           end
       end
       puts Benchmark.realtime {insert_user}
   end
end