class AllmenusController < ApplicationController
  # GET /allmenus
  # GET /allmenus.json
  def index
    @allmenus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @allmenus }
    end
  end

  # GET /allmenus/1
  # GET /allmenus/1.json
  def show
    @allmenu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @allmenu }
    end
  end

  # GET /allmenus/new
  # GET /allmenus/new.json
  def new
    @allmenu = Menu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @allmenu }
    end
  end

  # GET /allmenus/1/edit
  def edit
    @allmenu = Menu.find(params[:id])
  end

  # POST /allmenus
  # POST /allmenus.json
  def create
    @allmenu = Menu.new(params[:allmenu])

    respond_to do |format|
      if @allmenu.save
        format.html { redirect_to @allmenu, notice: 'Menu was successfully created.' }
        format.json { render json: @allmenu, status: :created, location: @allmenu }
      else
        format.html { render action: "new" }
        format.json { render json: @allmenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /allmenus/1
  # PUT /allmenus/1.json
  def update
    @allmenu = Menu.find(params[:id])

    respond_to do |format|
      if @allmenu.update_attributes(params[:allmenu])
        format.html { redirect_to @allmenu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @allmenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allmenus/1
  # DELETE /allmenus/1.json
  def destroy
    @allmenu = Menu.find(params[:id])
    @allmenu.destroy

    respond_to do |format|
      format.html { redirect_to allmenus_url }
      format.json { head :no_content }
    end
  end
end
