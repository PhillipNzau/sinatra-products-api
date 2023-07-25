class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    ## Supplier Routes
    get '/suppliers' do
        suppliers = Supplier.all
        suppliers.to_json(include: :products)
    end

    get '/suppliers/:id' do
        supplier = Supplier.find(params[:id])
        supplier.to_json(include: {products: {include: [:suppliers, :categories]} })
    end

    post '/suppliers' do
        supplier = Supplier.create({
            name: params[:name],
            address: params[:address],
            phone: params[:phone]
        })
        supplier.to_json
    end

    patch '/suppliers/:id' do
        supplier = Supplier.find(params[:id])
        supplier.update({
            name: params[:name],
            address: params[:address],
            phone: params[:phone]
        })
        supplier.to_json
    end

    delete '/suppliers/:id' do
        supplier = Supplier.find(params[:id])
        supplier.destroy
        supplier.to_json
    end

end