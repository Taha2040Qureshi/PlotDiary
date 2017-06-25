class Town::GivenInstallmentsController < Town::BaseController

  def index
    @title = 'Land Master Given Installments Details'
    @given_installments = current_town.given_installments.all
  end

  def new
    @given_installment = current_town.given_installments.new
  end

  def create
    number = number_of_installment[:number].to_i
    saved = false

    number.times { |i|
      @given_installment = current_town.given_installments.new(given_installments_params)
      @given_installment.town_id = current_user.town.id
      @given_installment.installment_id = LandMaster.find(@given_installment.land_master_id).installment_id
      if @given_installment.valid?
        @given_installment.save
        saved = true
        flash[:success] = "Installment Submitted"
      else
        flash[:errors] = @given_installment.errors.full_messages
      end
    }

    if saved
      return redirect_to town_given_installments_path
    else
      render :new
    end
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

  def get_installment_details
    @land_master = LandMaster.find(params[:land_master_id])
  end

  private

  def given_installments_params
    params.require(:given_installment).permit(:land_master_id, :town_id, :installment_id, :submit_date)
  end

  def number_of_installment
    params.require(:number_of_installment).permit(:number)
  end

end
