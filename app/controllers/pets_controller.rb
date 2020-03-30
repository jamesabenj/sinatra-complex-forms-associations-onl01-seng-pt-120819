class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @pets = Pet.all
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    #binding.pry
    @pet = Pet.create(name: params[:pet_name],owner_id: params[:pet][:owner_id])
    if !params["owner"]["name"].empty?
      binding.pry
      @pet.owner << Owner.create(name: params[:owner][:name])
    end
    redirect to "/pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
