class Town::EmployeesController < Town::BaseController

  def index
    @title = 'Employee Details'
    @employees = current_town.employees.all
  end

  def new
    @employee = current_town.employees.new
    @employee.build_address
  end

  def create
    @employee = current_town.employees.new(employee_params)
    @employee.town_id = current_user.town.id
    if @employee.valid?
      @employee.save
      flash[:success] = "Employee Detail has been successfully added"
      return redirect_to town_employees_path
    else
      flash[:errors] = @employee.errors.full_messages
    end
    render :new
  end

  def edit
    @employee = current_town.employees.where(:id => params[:id]).first
  end

  def show
    @employee = current_town.employees.where(:id => params[:id]).first
  end

  def update
    @employee = current_town.employees.where(:id => params[:id]).first
    if @employee.update_attributes(employee_params)
      flash[:success] = "Employee Detail has been updated!"
      return redirect_to town_employees_path
    else
      flash.now[:errors] = @employee.errors.full_messages
    end
    render :edit
  end

  def destroy
    employee = current_town.employees.where(:id => params[:id]).first
    employee.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :f_name, :cnic, :salary, :town_id, :designation, :address_attributes => [:address_1, :phone_number1, :secondary_phone_number ])
  end

end
