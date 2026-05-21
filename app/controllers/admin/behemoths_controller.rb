module Admin
  class BehemothsController < AdminController
    def index
      @behemoths = Behemoth.order(:name)
    end

    def new
      @behemoth = Behemoth.new
    end

    def create
      @behemoth= Behemoth.new(behemoth_params)
      if @behemoth.save
        redirect_to admin_behemoth_path(@behemoth), notice: "Behemoth was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show 
      set_behemoth
    end

    def update
      set_behemoth
      if @behemoth.update(behemoth_params)
        redirect_to admin_behemoth_path(@behemoth), notice: "Behemoth was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def edit
      set_behemoth
    end

    private 
    def set_behemoth
      @behemoth = Behemoth.find(params[:id])
    end

    def behemoth_params
      params.fetch(:behemoth, {}).permit(:name, :logo, location_ids:[], damage_type_ids:[], weakness_type_ids:[] )
    end

  end
end
