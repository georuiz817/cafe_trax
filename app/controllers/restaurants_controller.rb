class RestaurantsController < ApplicationController
 get '/restaurants' do
   @restaurants = current_user.restaurants.all
   erb :'restaurants/index'
  end

     get '/restaurants/new' do
        erb :'restaurants/new'
    end

    post '/restaurants' do
    @restaurant = current_user.restaurants.create(name: params["name"],location: params["location"], wifi_avaliable: params["wifi_avaliable"])
    redirect "restaurants/#{@restaurant.id}"
    end 


    get '/restaurants/:id' do
    @restaurant = Restaurant.find_by_id(params[:id])
    erb :'restaurants/show'
  end 
  
  get '/restaurants/:id/edit' do
   
        @restaurant = Restaurant.find_by_id(params[:id])
        if current_user.id == @restaurant.user_id
        erb :'restaurants/edit'
      else 
      redirect "/"
    end
    end 


 patch '/restaurants/:id' do 
        @restaurant = Restaurant.find_by_id(params[:id])
        @restaurant.name = params[:name]
        @restaurant.location = params[:location]
        @restaurant.wifi_avaliable = params[:wifi_avaliable]
        @restaurant.save
        redirect '/restaurants'
    end 

    
    delete '/restaurants/:id' do 
        @restaurant = Restaurant.find_by_id(params[:id])
        @restaurant.delete
        redirect '/restaurants'
    end 
    
    
  
 end
