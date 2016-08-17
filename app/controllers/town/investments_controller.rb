class Town::InvestmentsController < Town::BaseController

  def index
    @title = 'Investment Details'
    @investments = current_town.investments.all
  end

  def new
    @investment = current_town.investments.new
  end

  def create
    @investment = current_town.investments.new(investment_params)
    @investment.town_id = current_user.town.id
    if @investment.valid?
      @investment.save
      flash[:success] = "Investment has been successfully added"
      return redirect_to town_investments_path
    else
      flash[:errors] = current_town.investments.errors.full_messages
    end
    render :new
  end

  def destroy
    investment = current_town.investments.where(:id => params[:id]).first
    investment.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def investment_params
    params.require(:investment).permit(:amount)
  end

end
