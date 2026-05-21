module Admin
  class WeaponsController < AdminController
    def index
      @weapons = Weapon.order(:name)
    end

    def new
      @weapon = Weapon.new
    end

    def create
      @weapon = Weapon.new(weapon_params)
      if @weapon.save
        redirect_to admin_weapon_path(@weapon), notice: 'Weapon was successfully created'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      set_weapon
    end

    def update
      set_weapon
      if @weapon.update(weapon_params)
        redirect_to admin_weapon_path(@weapon), notice: 'Weapon was succesfully updated'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def show
      set_weapon
    end

    private
      def set_weapon
          @weapon = Weapon.find(params[:id])
      end

      def weapon_params
        params.fetch(:weapon, {}).permit(:name,
                                         :weapon_type,
                                         :base_power,
                                         :max_power,
                                         :elemental_power_id,
                                         :elemental_power_amount,
                                         :perk_amount,
                                         :perk_id,
                                         :cell_slot_type_one,
                                         :cell_slot_type_two,
                                         :unique_effect)
      end

  end
end
