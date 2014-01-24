class LinkComponentsController < ApplicationController
  before_action :set_link_component, only: [:show, :edit, :update, :destroy]

  # GET /link_components
  def index
    @link_components = LinkComponent.all
  end

  # GET /link_components/1
  def show
  end

  # GET /link_components/new
  def new
    @link_component = LinkComponent.new
  end

  # GET /link_components/1/edit
  def edit
  end

  # POST /link_components
  def create
    @problem = Problem.find params[:problem_id]
    @link_component = LinkComponent.new(link_component_params)

    if @link_component.save
      redirect_to @link_component, notice: 'Link component was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /link_components/1
  def update
    if @link_component.update(link_component_params)
      redirect_to @link_component, notice: 'Link component was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /link_components/1
  def destroy
    @link_component.destroy
    redirect_to link_components_url, notice: 'Link component was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_component
      @link_component = LinkComponent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_component_params
      params.require(:link_component).permit(:link)
    end
end
