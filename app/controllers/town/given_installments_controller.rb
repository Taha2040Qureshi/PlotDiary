class Town::GivenInstallmentsController < Town::BaseController

  def index
    @title = 'Land Master Given Installments Details'
    @given_installments = current_town.given_installments.all
  end

  def new
    @given_installment = current_town.given_installments.new
  end

  def create
    @given_installment = current_town.given_installments.new(given_installments_params)
    @given_installment.town_id = current_user.town.id
    if @given_installment.valid?
      @given_installment.save
      flash[:success] = "Stake Holder has been successfully added"
      return redirect_to town_given_installments_path
    else
      flash[:errors] = @given_installment.errors.full_messages
    end
    render :new
  end

  def edit
    @given_installment = current_town.given_installments.where(:id => params[:id]).first
  end

  def show
    @given_installment = current_town.given_installments.where(:id => params[:id]).first
  end

  def update
    @given_installment = current_town.given_installments.where(:id => params[:id]).first
    if @given_installment.update_attributes(given_installments_params)
      flash[:success] = "Stake Holder datails has been updated!"
      return redirect_to town_given_installments_path
    else
      flash.now[:errors] = @given_installment.errors.full_messages
    end
    render :edit
  end

  def destroy
    given_installment = current_town.given_installments.where(:id => params[:id]).first
    given_installment.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def given_installments_params
    params.require(:given_installment).permit(:land_master_id, :town_id, :installment_id, :submit_date)
  end

end