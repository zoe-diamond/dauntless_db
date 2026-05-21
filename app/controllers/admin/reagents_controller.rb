module Admin
  class ReagentsController < AdminController
    def index
      @reagents = Reagent.order(:name)
    end

    def new
      @reagent = Reagent.new
    end

    def create
      @reagent= Reagent.new(reagent_params)
      if @reagent.save
        redirect_to admin_reagent_path(@reagent), notice: "Reagent was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show 
      set_reagent
    end

    def update
      set_reagent
      if @reagent.update(reagent_params)
        redirect_to admin_reagent_path(@reagent), notice: "Reagent was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def edit
      set_reagent
    end

    private 
    def set_reagent
      @reagent = Reagent.find(params[:id])
    end

    def reagent_params
      params.fetch(:reagent, {}).permit(:name, :rarity, :behemoth_id)
    end

  end
end

