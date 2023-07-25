class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    # Create collection (category and product)
    post '/collections' do
        new_collection = Collection.create({
            category_id: params[:category_id],
            product_id: params[:product_id]
        })
        new_collection.to_json
    end

    delete '/collections/:id' do
        collection = Collection.find(params[:id])
        collection.destroy
        collection.to_json
    end

end