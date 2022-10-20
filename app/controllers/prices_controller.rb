class PricesController < ApplicationController
  before_action :set_price, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  def list_stocks
    ticket_id = Ticket.where("name = ?", params[:ticket_name]).pluck(:id)
    @prices = Price.where("ticket_id = ?", ticket_id)
    @prices = @prices.where("date = ?", params[:date])
    @pagy, @prices = pagy(@prices)
    render :json => @prices
  end

  def show
    render :json => @prices

  end
  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices or /prices.json
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        # format.html { redirect_to price_url(@price), notice: "Price was successfully created." }
        format.json { render :show, status: :created, location: @price }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1 or /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        # format.html { redirect_to price_url(@price), notice: "Price was successfully updated." }
        format.json { render :show, status: :ok, location: @price }
      else
        # format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1 or /prices/1.json
  def destroy
    @price.destroy

    respond_to do |format|
      # format.html { redirect_to prices_url, notice: "Price was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def price_params
      params.require(:price).permit(:open_price, :highest_price, :lowest_price, :volume, :close_price, :date, :ticket_id)
    end
end
