class Town::CustomersController < Town::BaseController

  def index
    @title = 'Customer Details'
    @customers = current_town.customers.all
  end

  def new
    @customer = current_town.customers.new
    @customer.build_address
    @customer.build_installment
  end

  def create
    @customer = current_town.customers.new(customer_params)
    @customer.town_id = current_user.town.id
    @customer.installment.town_id = current_user.town.id
    @customer.installment.installment_type = 1
    if @customer.valid?
      @customer.save
      flash[:success] = "Customer has been successfully added"
      return redirect_to town_customers_path
    else
      flash[:errors] = @customer.errors.full_messages
    end
    render :new
  end

  def edit
    @customer = current_town.customers.where(:id => params[:id]).first
  end

  def show
    @customer = current_town.customers.where(:id => params[:id]).first
  end

  def update
    @customer = current_town.customers.where(:id => params[:id]).first

    puts @customer.installment.inspect
    if @customer.update_attributes(customer_params)
      flash[:success] = "Customer has been updated!"
      return redirect_to town_customers_path
    else
      flash.now[:errors] = @customer.errors.full_messages
    end
    render :edit
  end

  def destroy
    customer = current_town.customers.where(:id => params[:id]).first
    customer.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :f_name, :cnic, :plot_id, :status,:town_id,
                                     :address_attributes => [:id, :address_1, :address_2, :phone_number1, :secondary_phone_number, :_destroy],
                                     :installment_attributes => [:id, :town_id, :total_amount, :advance_amount, :total_number_of_installments, :per_installments_amount, :installment_type, :_destroy])
  end
end
