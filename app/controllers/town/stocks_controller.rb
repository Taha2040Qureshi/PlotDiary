class Town::StocksController < Town::BaseController

  def index
    @title = 'Stocks Details'
    @stocks = current_town.stocks.all
  end

  def new
    @stock = current_town.stocks.new
  end

  def create
    @stock = current_town.stocks.new(stock_params)
    @stock.town_id = current_user.town.id
    if @stock.valid?
      @stock.save
      flash[:success] = "Plot has been successfully added"
      return redirect_to town_stocks_path
    else
      flash[:errors] = @stock.errors.full_messages
    end
    render :new
  end


  def destroy
    stock = current_town.stocks.where(:id => params[:id]).first
    stock.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def stock_params
    params.require(:stock).permit(:name,:town_id, :expense_id)
  end

end