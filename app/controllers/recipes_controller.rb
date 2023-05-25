class RecipesController < ApplicationController
<<<<<<< HEAD
  #load_and_authorize_resource

  before_action :find_user
  # GET /recipes
  def index
    @recipes = @user.recipes.all
  end

  # GET /recipes/:id
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.all
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(id: @recipe.id), notice: 'Recipe created successfully'
    else
      flash.now[:alert] = @recipe.errors.full_messages.first if @recipe.errors.any?
      render :new, status: 400
    end
  end

  # GET /recipes/:id/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # PATCH /recipes/:id
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def find_user
    @user = current_user
  end
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :description, :prep_time, :cook_time)
  end
=======
>>>>>>> dev
end
