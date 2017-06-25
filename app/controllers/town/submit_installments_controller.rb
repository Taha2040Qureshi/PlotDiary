class Town::SubmitInstallmentsController < Town::BaseController

  def index
    @title = 'Submit Installments Details'
    @submit_installments = current_town.submit_installments.all
  end

  def new
    @submit_installment = current_town.submit_installments.new
  end

  def create
    number = number_of_installment[:number].to_i
    saved = false
    number.times { |i|
      @submit_installment = current_town.submit_installments.new(submit_installment_params)
      @submit_installment.town_id = current_user.town.id
      @submit_installment.installment_id = Customer.find(@submit_installment.customer_id).installment_id
      if @submit_installment.valid?
        @submit_installment.save
        saved = true
        flash[:success] = "Installment Submitted"
      else
        flash[:errors] = @submit_installment.errors.full_messages
      end
    }
    if saved
      return redirect_to town_submit_installments_path
    else
      render :new
    end
  end

  def edit
    @submit_installment = current_town.submit_installments.where(:id => params[:id]).first
  end

  def show
    @submit_installment = current_town.submit_installments.where(:id => params[:id]).first
  end

  def update
    @submit_installment = current_town.submit_installments.where(:id => params[:id]).first
    if @submit_installment.update_attributes(submit_installment_params)
      flash[:success] = "Installment updated!"
      return redirect_to town_submit_installments_path
    else
      flash.now[:errors] = @submit_installment.errors.full_messages
    end
    render :edit
  end

  def destroy
    submit_installment = current_town.submit_installments.where(:id => params[:id]).first
    submit_installment.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  def get_installment_details
    @customer = Customer.find(params[:customer_id])
  end

  private

  def submit_installment_params
    params.require(:submit_installment).permit(:customer_id, :town_id, :installment_id, :submit_date)
  end

  def number_of_installment
    params.require(:number_of_installment).permit(:number)
  end

end
