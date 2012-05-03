class MenusController < ApplicationController
  before_filter :load_restrant
  def load_restrant
    @restrant = Restrant.find(params[:restrant_id])
  end
  
  # GET /menus
  # GET /menus.json
  def index
    if(@restrant)then
      @menus = @restrant.menus.order("date").all
    else
      @menus = Menu.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    if(@restrant)then
      @menu = @restrant.menus.new
    else
      @menu = Menu.new
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    if(@restrant)then
      @menu = @restrant.menus.new(params[:menu])
    else
      @menu = Menu.new(params[:menu])
    end

    respond_to do |format|
      if @menu.save
        format.html { redirect_to([@restrant,@menu], notice: 'Menu was successfully created.') }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    if(@restrant)then
      @menu = @restrant.menus.find(params[:id])
    else
      @menu = Menu.find(params[:id])
    end

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to [@restrant, @menu], notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    if(@restrant)then
      @menu = @restrant.menus.find(params[:id])
    else
      @menu = Menu.find(params[:id])
    end
    @menu.destroy

    respond_to do |format|
#      format.html { redirect_to menus_url }
      format.html { redirect_to restrant_menus_url(@restrant) }
      format.json { head :no_content }
    end
  end
end
