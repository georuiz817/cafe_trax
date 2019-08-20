
class CafeController < ApplicationController
 get '/cafes' do
    @cafes = Cafe.all
    erb :index
  end

     get '/cafes/new' do
        erb :'cafes/new'
    end

    post '/cafes' do
    @cafe = Cafe.create(params)
    redirect '/cafes/#{@cafe.id}'
    end 


    get '/cafes/:id' do
    @cafe = Cafe.find(params[:id])
    erb :'cafes/show'
  end 
  
    get '/cafes/:id/edit' do 
        @cafe = Cafe.find(params[:id])
        erb :edit
    end 


 patch '/cafes/:id' do 
        @cafe = Cafe.find(params[:id])
        @cafe.name = params[:name]
        @cafe.location = params[:location]
        @cafe.wifi_avaliable = params[:wifi_avaliable]
        @cafe.save
        redirect '/cafes'
    end 

    delete '/cafes/:id' do 
        Cafe.destroy(params[:id])
        redirect '/cafes'
    end 

    

  end 
