class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/recipes" do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipes = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipes.id}"
  end

  get "/recipes/:id" do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = parmas[:name]
    @recipe.ingredients = parmas[:ingredients]
    @recipe.cook_time = parmas[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipes.id}"
  end

  delete "/recipes/:id" do
    # binding.pry
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect to "/recipes"
  end
end
