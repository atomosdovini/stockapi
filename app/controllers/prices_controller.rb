class PricesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def list_stocks
    ticket_id = Ticket.where("name = ?", params[:ticket_name]).pluck(:id)
    @prices = Price.where("ticket_id = ?", ticket_id)
    @prices = @prices.where("date = ?", params[:date])
    @pagy, @prices = pagy(@prices)
    render :json => @prices
  end

end
