class LittleShopApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true


  get "/" do
    @categories = Category.all
    erb :"dashboard"
  end

  get "/merchants/show_input" do
    @merchants = Merchant.all
    erb :"merchants/show_input"
  end

  get "/merchants/edit_input" do
    @merchants = Merchant.all
    erb :"merchants/edit_input"
  end

  get "/merchants" do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  delete "/merchants/:id" do |id|
    Merchant.destroy(id.to_i)
    redirect "/merchants"
  end

  get "/merchants/new" do
    erb :"merchants/new"
  end

  get "/merchants/" do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get "/merchants/:id" do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  post "/merchants" do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect "/merchants"
  end

  get "/merchants/edit/" do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  get "/merchants/edit/:id" do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  put "/merchants/:id" do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{params[:merchant][:id]}"
  end

  get "/merchants-dashboard" do
    @merchants = Merchant.all
    @most_items_id = Merchant.most_items.id
    @most_items_name = Merchant.most_items.name
    @highest_priced_item_id = Merchant.highest_priced_item.id
    @highest_priced_item_name = Merchant.highest_priced_item.name
    erb :"merchants/dashboard"
  end

  get "/categories" do
    @categories = Category.all
    erb :"categories/index"
  end

  get "/categories/new" do
    erb :"categories/new"
  end

  post "/categories" do
    category = Category.new(params[:category])
    category.save
    redirect "/categories"
  end

  get "/categories/:name/edit" do
    @category = Category.find_by(name: params[:name])
    erb :"categories/edit"
  end

  put "/categories/:name" do
    Category.update(params[:category][:id], params[:category])
    redirect "/categories/#{params[:category][:name]}"
  end

  delete "/categories/:name" do |name|
    category = Category.find_by(name: name)
    Category.destroy(category.id)
    redirect "/categories"
  end

  get "/categories-dashboard" do
    @categories = Category.all
    @category_with_most_expensive_item = Category.most_expensive_item_category.name
    @category_with_least_expensive_item = Category.least_expensive_item_category.name
    erb :"categories/dashboard"
  end

  get "/items/show_input" do
    @items = Item.all
    erb :"items/show_input"
  end

  get "/items/edit_input" do
    @items = Item.all
    erb :"items/edit_input"
  end

  get "/items" do
    @items = Item.all
    erb :"items/index"
  end

  get "/items/new" do
     @merchants = Merchant.all
     @categories = Category.all
    erb :"items/new"
  end

  get "/items/" do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  get "/items/:id" do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  post "/items" do
    item = Item.new(params[:item])
    item.save
    redirect "/items"
  end

  get "/items/edit/" do
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  get "/items/edit/:id" do
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  put "/items/:id" do |id|
    Item.update(id.to_i, params[:item])
    redirect "/items/#{params[:item][:id]}"
  end

  delete "/items/:id" do |id|
    Item.destroy(id.to_i)
    redirect "/items"
  end

  get "/items-dashboard" do
    @item_count = Item.count
    @average_item_price = Item.average_price
    @recent_item = Item.newest_item.name
    @oldest_item = Item.oldest_item.name
    erb :"items/dashboard"
  end

  not_found do
    status 404
    erb :"error"
  end

end
