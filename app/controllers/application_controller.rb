class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

   get '/bakeries' do
      # get all the bakeries from the database
      bakeries = Bakery.all
      # send them back as a JSON array
      bakeries.to_json
  
    end

  get '/bakeries/:id' do
    # get all the bakeries from the database
    bakery = Bakery.find(params[:id])
    # send them back as a JSON array
    bakery.to_json(include: :baked_goods)

  end

  get '/baked_goods' do
  baked_goods = BakedGood.all.to_json

  end

  get '/baked_goods/by_price' do
  baked_goods = BakedGood.order("price DESC")
  baked_goods.to_json

  end

  get '/baked_goods/most_expensive' do 
  baked_goods = BakedGood.order("price DESC").first
  baked_goods.to_json(only: [:name, :price])


  end


end
