class Town::ExpensesController < Town::BaseController

  def index
    @title = 'Expense Details'
    @expenses = current_town.expenses.all
  end

  def new
    @expense = current_town.expenses.new
  end

  def create
    @expense = current_town.expenses.new(expense_params)
    @expense.town_id = current_user.town.id
    if @expense.valid?
      @expense.save
      flash[:success] = "Expense has been successfully added"
      return redirect_to town_expenses_path
    else
      flash[:errors] = @expense.errors.full_messages
    end
    render :new
  end

  def edit
    @expense = current_town.expenses.where(:id => params[:id]).first
  end

  def show
    @expense = current_town.expenses.where(:id => params[:id]).first
  end

  def update
    @expense = current_town.expenses.where(:id => params[:id]).first
    if @expense.update_attributes(expense_params)
      flash[:success] = "Time Log has been updated!"
      return redirect_to town_expenses_path
    else
      flash.now[:errors] = @expense.errors.full_messages
    end
    render :edit
  end

  def destroy
    expense = current_town.expenses.where(:id => params[:id]).first
    expense.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :expense_date, :status, :town_id, :expense_type_id, :description)
  end

end
