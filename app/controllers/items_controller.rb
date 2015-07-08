class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.friendly.find(params[:id])
    @item.qr_code ||= @item.generate_qr
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.friendly.find(params[:id])
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
    @item = Item.friendly.find(params[:id])
      if @item.update(item_params)
        redirect_to @item, notice: t('.success_updated')
      else
        render action: 'index'
      end
  end

  def destroy
    @item = Item.friendly.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def search
    @items = Item.friendly.find(params[:search_field])
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :location,
      :description,
      :avatar,
      :lock_version,
      :slug)
  end

end