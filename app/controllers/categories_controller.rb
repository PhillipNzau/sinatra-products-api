class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    ## Category Routes
    get '/categories' do 
        categories = Category.all
        categories.to_json( include: :products )
    end

    get '/categories/:id' do
        category = Category.find(params[:id])
        category.to_json( include: {products: {include: [:categories, :suppliers] }})
    end

    post '/categories' do
        category = Category.create({
            name: params[:name],
            description: params[:description]
        })
        category.to_json
    end

    patch '/categories/:id' do
        category = Category.find(params[:id])
        category.update({
            name: params[:name],
            description: params[:description]
        })
        category.to_json
    end

    delete '/categories/:id' do
        category = Category.find(params[:id])
        category.destroy
        category.to_json
    end
end