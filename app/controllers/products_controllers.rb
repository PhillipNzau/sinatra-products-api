class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'   

    ## Product Routes
    get "/products" do
        products = Product.all
        products.to_json(include: [:categories, :suppliers, :purchases])
    end

    get '/products/:id' do
        product = Product.find(params[:id])
        product.to_json(include: [:categories, :suppliers, :purchases])
    end

    post "/products" do
        new_product = Product.create({
            name: params[:name],
            inventory: params[:inventory],
            retail_price: params[:retail_price],
            image: params[:image]
        })

        new_collection = Collection.create({
            product_id: new_product.id,
            category_id: params[:category]
        }).to_json

        new_purchase = Purchase.create({
            product_id: new_product.id,
            supplier_id: params[:supplier]
        }).to_json

        new_product.to_json
    end

    patch '/products/:id' do
        product = Product.find(params[:id])
        product.update({
            name: params[:name],
            inventory: params[:inventory],
            retail_price: params[:retail_price],
            image: params[:image]
        })
        product.to_json
    end

    delete '/products/:id' do
        product = Product.find(params[:id])
        product.destroy
        product.to_json
    end
end