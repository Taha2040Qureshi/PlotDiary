class Town::LandMastersController < Town::BaseController

  def index
    @title = 'LandMaster Details'
    @land_masters = current_town.land_masters.all
  end

  def new
    @land_master = current_town.land_masters.new
    @land_master.build_address
    @land_master.build_installment
  end

  def create
    @land_master = current_town.land_masters.new(land_master_params)
    @land_master.town_id = current_user.town.id
    @land_master.installment.town_id = current_user.town.id
    @land_master.installment.installment_type = 2
    if @land_master.valid?
      @land_master.save
      flash[:success] = "Land Master has been successfully added"
      return redirect_to town_land_masters_path
    else
      flash[:errors] = @land_master.errors.full_messages
    end
    render :new
  end

  def edit
    @land_master = current_town.land_masters.where(:id => params[:id]).first
  end

  def show
    @land_master = current_town.land_masters.where(:id => params[:id]).first
  end

  def update
    @land_master = current_town.land_masters.where(:id => params[:id]).first
    if @land_master.update_attributes(land_master_params)
      flash[:success] = "Land Master info has been updated!"
      return redirect_to town_land_masters_path
    else
      flash.now[:errors] = land_master.errors.full_messages
    end
    render :edit
  end

  def destroy
    land_master = current_town.land_masters.where(:id => params[:id]).first
    land_master.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def land_master_params
    params.require(:land_master).permit(:name, :f_name, :cnic, :town_id, :installment_id, :address_attributes => [:address_1, :address_2, :phone_number1, :secondary_phone_number ])
  end

end
