class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true


  get "/" do
    erb :"dashboard"
  end

  get "/merchants/show_input" do
    @merchants = Merchant.all
    erb :"merchants/show_input"
  end

  get "/merchants" do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get "/merchants/new" do
    erb :"merchants/new"
  end

  get "/merchants/" do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  post "/merchants" do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect "/merchants"
  end

  get "/merchants/:id/edit" do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  put "/merchants/:id" do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete "/merchants/:id" do |id|
    Merchant.destroy(id.to_i)
    redirect "/merchants"
  end

  get "/categories" do
    erb :"categories/index"
  end

end
