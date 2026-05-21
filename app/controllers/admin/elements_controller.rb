module Admin
  class ElementsController < AdminController
    
    def index
      @elements = Element.order(:name)
    end

    def show
      set_element
    end

    def new
      @element = Element.new
    end

    def edit
      set_element
    end

    def update
      set_element
      if @element.update(admin_elements_params)
        redirect_to admin_element_path(@element), notice: 'Element was succesfully updated'
      else
        render :edit, status: :unprocessable_entity
      end

    end

    def create
      @element = Element.new(admin_elements_params)
      if @element.save
        redirect_to admin_elements_path, notice: 'Element was successfully updated'
      else 
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_element 
      @element = Element.find(params[:id])
    end
      
    def admin_elements_params
      params.fetch(:element, {}).permit(:name, :avatar)
    end

  end

end