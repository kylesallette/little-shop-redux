class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true


  get '/' do
    erb :index
  end



  get "/merchants" do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get "/merchants/:id" do
    @merchant = Merchant.find(params[:merchant_id])
    erb :"merchants/show"
  end

  get "/merchants/new" do
    erb :"new"
  end

  post "/merchants" do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect "/merchants"
  end

  get "/merchants/:id/edit" do
    @merchant = Merchant.find(params[:merchant_id])
    erb :"edit"
  end

  put "/merchants/:id" do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete "/merchants/:id" do |id|
    Merchant.destroy(id.to_i)
    redirect "merchants"
  end
end
