class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
     if @item.save
       redirect_to @item, notice: t('.success_created')
     else
       render action: 'new'
     end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: t('.success_updated')
    else
      render action: 'index'
    end

  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

    def set_item
      @item = Item.friendly.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
          :name,
          :ubication,
          :description,
          :avatar,
          :lock_version,
          :slug)
    end

end
