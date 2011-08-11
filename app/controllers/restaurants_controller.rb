class RestaurantsController < ApplicationController

  layout 'management'
  before_filter :require_admin
  skip_before_filter :get_company

  # GET /restaurants
  # GET /restaurants.xml
  def index
    @restaurants = Restaurant.where("name like ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @restaurants.map(&:attributes)  }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.xml
  def show
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.xml
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.xml
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.xml
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to(@restaurant, :notice => 'Restaurant was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.xml
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to(restaurants_url) }
    end
  end
end
