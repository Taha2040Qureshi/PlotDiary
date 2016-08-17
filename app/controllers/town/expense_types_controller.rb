class Town::ExpenseTypesController < Town::BaseController

  def index
    @title = 'Expense Types'
    @expense_types = current_town.expense_types.all
  end

  def new
    @expense_type = current_town.expense_types.new
  end

  def create
    @expense_type = current_town.expense_types.new(expense_params)
    @expense_type.town_id = current_user.town.id
    if @expense_type.valid?
      @expense_type.save
      flash[:success] = "Expense has been successfully added"
      return redirect_to town_expense_types_path
    else
      flash[:errors] = @expense_type.errors.full_messages
    end
    render :new
  end


  def destroy
    expense_type = current_town.expense_types.where(:id => params[:id]).first
    expense_type.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private
  def expense_params
    params.require(:expense_type).permit(:name)
  end

end
