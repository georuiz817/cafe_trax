class RestaurantsController < ApplicationController
 get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurants/index'
  end

     get '/restaurants/new' do
        erb :'restaurants/new'
    end

    post '/restaurants' do
    @restaurant = Restaurant.create(params)
    redirect "/restaurants/#{@restaurant.id}"
    end 


    get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    erb :'restaurants/show'
  end 
  
    get '/restaurants/:id/edit' do 
        @restaurant = Restaurant.find(params[:id])
        erb :'restaurants/edit'
    end 


 patch '/restaurants/:id' do 
        @restaurant = Restaurant.find(params[:id])
        @restaurant.name = params[:name]
        @restaurant.location = params[:location]
        @restaurant.wifi_avaliable = params[:wifi_avaliable]
        @restaurant.save
        redirect '/restaurants'
    end 

    delete '/restaurants/:id' do 
        Restaurant.destroy(params[:id])
        redirect '/'
    end 

    

  end 
