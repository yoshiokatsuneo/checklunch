class RestrantsController < ApplicationController
  # GET /restrants
  # GET /restrants.json
  def index
    @restrants = Restrant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restrants }
    end
  end

  # GET /restrants/1
  # GET /restrants/1.json
  def show
    @restrant = Restrant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restrant }
    end
  end

  # GET /restrants/new
  # GET /restrants/new.json
  def new
    @restrant = Restrant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restrant }
    end
  end

  # GET /restrants/1/edit
  def edit
    @restrant = Restrant.find(params[:id])
  end

  # POST /restrants
  # POST /restrants.json
  def create
    @restrant = Restrant.new(params[:restrant])

    respond_to do |format|
      if @restrant.save
        format.html { redirect_to @restrant, notice: 'Restrant was successfully created.' }
        format.json { render json: @restrant, status: :created, location: @restrant }
      else
        format.html { render action: "new" }
        format.json { render json: @restrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restrants/1
  # PUT /restrants/1.json
  def update
    @restrant = Restrant.find(params[:id])

    respond_to do |format|
      if @restrant.update_attributes(params[:restrant])
        format.html { redirect_to @restrant, notice: 'Restrant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restrant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restrants/1
  # DELETE /restrants/1.json
  def destroy
    @restrant = Restrant.find(params[:id])
    @restrant.destroy

    respond_to do |format|
      format.html { redirect_to restrants_url }
      format.json { head :no_content }
    end
  end
end
