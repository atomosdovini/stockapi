require 'csv'

ticket = Hash.new
archives_csv_path = Rails.root + 'db/stocks/*'
tickets = Dir[archives_csv_path]
tickets.each do |file|
    ticket[:name] = File.basename(file,File.extname(file))  
    Ticket.create(ticket) #unique = true
    ticket_id = Ticket.where("name = ?", ticket[:name]).pluck(:id)
    prices_ticket = Price.where("ticket_id = ?", ticket_id[0])
    CSV.foreach(file, headers: true) do |prices|
        prices.delete("Adj Close")
        price_ticket = prices_ticket.where("date = ?", prices["Date"])
        if !price_ticket.exists? == true
            prices = prices.to_h
            prices[:date] = prices.delete("Date")
            prices[:open_price] = prices.delete("Open")
            prices[:highest_price] = prices.delete("High")
            prices[:lowest_price] = prices.delete("Low")
            prices[:close_price] = prices.delete("Close")
            prices[:volume] = prices.delete("Volume") 
            prices[:ticket_id] = ticket_id[0]
            Price.create(prices)
        end
    end 
end
