module Admin
  class LocationsController < AdminController
    def index
      @locations = Location.order(:name)
    end

    def show
      @location = Location.find(params[:id])
    end

    def new
      @location = Location.new
    end

    def edit
      @location = Location.find(params[:id])
    end

    def destroy
      @location = Location.find(params[:id])
      @location.destroy

      redirect_to admin_locations_path
    end

    def update
      @location = Location.find(params[:id]) 
        if @location.update(locations_params)
          redirect_to admin_locations_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def create
      @location = Location.new(locations_params)
      @location.save
      redirect_to admin_locations_path
    end

    private

    def locations_params
      params.require(:location).permit(:name, :parent_id)
    end
    
  end
end
