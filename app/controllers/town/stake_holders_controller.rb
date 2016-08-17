class Town::StakeHoldersController < Town::BaseController

  def index
    @title = 'Stake Holders Details'
    @stake_holders = current_town.stake_holders.all
  end

  def new
    @stake_holder = current_town.stake_holders.new
    @stake_holder.build_address
  end

  def create
    @stake_holder = current_town.stake_holders.new(stake_holder_params)
    @stake_holder.town_id = current_user.town.id
    if @stake_holder.valid?
      @stake_holder.save
      flash[:success] = "Stake Holder has been successfully added"
      return redirect_to town_stake_holders_path
    else
      flash[:errors] = @stake_holder.errors.full_messages
    end
    render :new
  end

  def edit
    @stake_holder = current_town.stake_holders.where(:id => params[:id]).first
  end

  def show
    @stake_holder = current_town.stake_holders.where(:id => params[:id]).first
  end

  def update
    @stake_holder = current_town.stake_holders.where(:id => params[:id]).first
    if @stake_holder.update_attributes(stake_holder_params)
      flash[:success] = "Stake Holder datails has been updated!"
      return redirect_to town_stake_holders_path
    else
      flash.now[:errors] = @stake_holder.errors.full_messages
    end
    render :edit
  end

  def destroy
    stake_holder = current_town.stake_holders.where(:id => params[:id]).first
    stake_holder.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def stake_holder_params
    params.require(:stake_holder).permit(:name, :f_name, :cnic, :town_id, :address_attributes => [:address_1, :address_2, :phone_number1, :secondary_phone_number ])
  end

end