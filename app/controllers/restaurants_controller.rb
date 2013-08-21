require 'open-uri'

class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])
    if params[:update_menu_from_url] then
      update_menu_from_url
      return
    end

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
          format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
          format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end
  def self.update_all_restaurants_menus_itr
    restaurants = Restaurant.all
    restaurants.each{|restaurant|
      update_menu_from_url_itr(restaurant)
    }
  end
  def update_all_restaurants_menus
    self.class.update_all_restaurants_menus_itr
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Restaurant was successfully updated.' }
      format.json { head :no_content }
    end
  end
  def self.update_menu_from_url_itr(restaurant)
    restaurant.menus.destroy_all
    body = open(restaurant.menu_url).read
    doc = JSON.parse(body)
    if doc.class != Array then
    	return
    end
    doc.each{|item|
        date = item['date']
        title = item['title']
        price = item['price']
        menu = restaurant.menus.new({:date => date, :title => title, :price => price})
        menu.save
      }    
  end
  def update_menu_from_url
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes(params[:restaurant])
    self.class.update_menu_from_url_itr(@restaurant)
    respond_to do |format|
      format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
      format.json { head :no_content }
    end
    
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
end
