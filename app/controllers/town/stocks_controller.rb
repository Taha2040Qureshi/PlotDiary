class Town::StocksController < Town::BaseController

  def index
    @title = 'Stocks Details'
    @stocks = current_town.stocks.all
  end

  def new
    @stock = current_town.stocks.new
    @stock.build_expense
  end

  def create
    expense_type = ExpenseType.where(name: 'stock').first

    expense = Expense.new(expense_params[:expense])
    expense.town_id = current_user.town.id
    expense.expense_type_id = expense_type.id
    expense.save

    @stock = current_town.stocks.new(stock_params)
    @stock.expense_id = expense.id
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
    params.require(:stock).permit(:name,:town_id)
  end

  def expense_params
    params.require(:stock).permit(:expense => [:amount])
  end

end
