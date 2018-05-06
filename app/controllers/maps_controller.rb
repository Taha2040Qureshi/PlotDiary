class MapsController < InheritedResources::Base

  private

    def map_params
      params.require(:map).permit(:latitude, :longitude, :address, :title)
    end
end

