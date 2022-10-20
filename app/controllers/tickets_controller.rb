class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
    render :json => @tickets
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

#   # POST /tickets or /tickets.json
#   def create
#     @ticket = Ticket.new(ticket_params)

#       if @ticket.save
#         render :show, status: :created, location: @ticket  
#       else
#         render json: @ticket.errors, status: :unprocessable_entity 
#       end
#     end
#   end

#   # PATCH/PUT /tickets/1 or /tickets/1.json
#   def update
#     respond_to do |format|
#       if @ticket.update(ticket_params)
#         format.json { render :show, status: :ok, location: @ticket }
#       else
#         format.json { render json: @ticket.errors, status: :unprocessable_entity }
#       end
#     end
#   end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy

    @ticket.destroy
    @prices = Price.where("ticket_id = ?",params[:id])
    @prices.delete_all
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
      puts @ticket.inspect
      puts 'tjos is es o tiecktet'
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:name)
    end
end
