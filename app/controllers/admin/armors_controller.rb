module Admin
  class ArmorsController < AdminController
    def index
      @armors = Armor.order(:name)
    end

    def new
      @armor = Armor.new
    end

    def create
      @armor= Armor.new(armor_params)
      if @armor.save
        redirect_to admin_armor_path(@armor), notice: "Armor was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show 
      set_armor
    end

    def update
      set_armor
      if @armor.update(armor_params)
        redirect_to admin_armor_path(@armor), notice: "Armor was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def edit
      set_armor
    end

    private 
    def set_armor
      @armor = Armor.find(params[:id])
    end

    def armor_params
      params.fetch(:armor, {}).permit(:name, :cell_slot_type, :base_armor, :elemental_resistance_amount, :elemental_weakness_amount, :perk_amount,
        :elemental_weakness_id, :elemental_resistance_id, :perk_id, :armor_type)
    end

  end
end

