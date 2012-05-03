require 'open-uri'

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
    if params[:update_menu_from_url] then
      update_menu_from_url
      return
    end

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
  def self.update_all_restrants_menus_itr
    restrants = Restrant.all
    restrants.each{|restrant|
      update_menu_from_url_itr(restrant)
    }
  end
  def update_all_restrants_menus
    update_all_restrants_menus_itr
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Restrant was successfully updated.' }
      format.json { head :no_content }
    end
  end
  def self.update_menu_from_url_itr(restrant)
    restrant.menus.destroy_all
    body = open(restrant.menu_url).read
    doc = JSON.parse(body)
    doc.each{|item|
        date = item['date']
        title = item['title']
        price = item['price']
        menu = restrant.menus.new({:date => date, :title => title, :price => price})
        menu.save
      }    
  end
  def update_menu_from_url
    @restrant = Restrant.find(params[:id])
    @restrant.update_attributes(params[:restrant])
    update_menu_from_url_itr(@restrant)
    respond_to do |format|
      format.html { redirect_to @restrant, notice: 'Restrant was successfully updated.' }
      format.json { head :no_content }
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
