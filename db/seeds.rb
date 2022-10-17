require 'csv'
require 'uri'

path = Rails.root + 'db/stocks/*'
archives = Dir[path]

tickets = []

archives.each do |file|
    tickets << file
end
puts tickets

tickets.each do |file|
    ticket = Hash.new
    ticket[:name] = File.basename(file,File.extname(file))    
    
    Ticket.create(ticket)
    
    CSV.foreach(file, headers: true) do |prices|
        
        prices  = prices.to_h
        prices.delete("Adj Close")
        prices[:open_price] = prices.delete("Open")
        prices[:highest_price] = prices.delete("High")
        prices[:lowest_price] = prices.delete("Low")
        prices[:close_price] = prices.delete("Close")
        prices[:date] = prices.delete("Date")
        prices[:volume] = prices.delete("Volume") 
        Price.create(prices)
    end

end





# puts "#{arr} aquasjdkls"