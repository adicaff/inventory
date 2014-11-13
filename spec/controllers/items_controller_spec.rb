require 'rails_helper'

describe ItemsController do

  let(:valid_attributes) { {name: 'Test Item', description: 'Testing', ubication: 'Test field'} }
  let(:invalid_attributes) { {name: '' } }
  let(:user) {  User.new( {email: 'test@test.com', password: 'testtest'} ) }
  let(:valid_session) { {} }

  describe '#index' do

    it 'assigns all items as @items' do
      item = Item.create! valid_attributes
      sign_in(FactoryGirl.create(:user))
      get :index, {}, valid_session
      expect(assigns(:items)).to eq([item])
    end

  end

  describe '#show' do

    it 'assigns the requested item as @item' do
      item = Item.create! valid_attributes
      sign_in(FactoryGirl.create(:user))
      get :show, {:id => item.to_param}, valid_session
      expect(assigns(:item)).to eq(item)
    end

  end

  describe '#new' do

    it 'assigns a new item as @item' do
      sign_in(FactoryGirl.create(:user))
      get :new, {}, valid_session
      expect(assigns(:item)).to be_a_new(Item)
    end

  end

  describe '#create' do

    describe 'with valid params' do

      it 'creates a new Item' do
        sign_in(FactoryGirl.create(:user))
        expect {
          post :create, {:item => valid_attributes}, valid_session
        }.to change(Item, :count).by(1)
      end

      it 'assigns a newly created item as @item' do
        sign_in(FactoryGirl.create(:user))
        post :create, {:item => valid_attributes}, valid_session
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it 'redirects to the created item' do
        sign_in(FactoryGirl.create(:user))
        post :create, {:item => valid_attributes}, valid_session
        expect(response).to redirect_to(Item.last)
      end

    end

    describe 'with invalid params' do

      it 'assigns a newly created but unsaved item as @item' do
        sign_in(FactoryGirl.create(:user))
        post :create, {:item => invalid_attributes}, valid_session
        expect(assigns(:item)).to be_a_new(Item)
      end

      it 're-renders the "new" template' do
        sign_in(FactoryGirl.create(:user))
        post :create, {:item => invalid_attributes}, valid_session
        expect(response).to render_template('new')
      end

    end
  end

  describe '#update' do

    describe 'with valid params' do

      let(:new_attributes) {
        {name: 'Updated Item', description: 'Updated', ubication: 'Test field'}
      }

      it 'updates the requested item' do
        sign_in(FactoryGirl.create(:user))
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => new_attributes}, valid_session
        item.reload
        expect(assigns(:item)).to eq(item)
      end

      it 'assigns the requested item as @item' do
        sign_in(FactoryGirl.create(:user))
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => valid_attributes}, valid_session
        expect(assigns(:item)).to eq(item)
      end

      it 'redirects to the item' do
        sign_in(FactoryGirl.create(:user))
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => valid_attributes}, valid_session
        expect(response).to redirect_to(item)
      end

    end

    describe 'with invalid params' do

      it 'assigns the item as @item' do
        sign_in(FactoryGirl.create(:user))
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => invalid_attributes}, valid_session
        expect(assigns(:item)).to eq(item)
      end

      it 're-renders the "edit" template' do
        sign_in(FactoryGirl.create(:user))
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => invalid_attributes}, valid_session
        expect(response).to render_template('index')
      end

    end

  end

  describe '#destroy' do

    it 'destroys the requested item' do
      sign_in(FactoryGirl.create(:user))
      item = Item.create! valid_attributes
      expect {
        delete :destroy, {:id => item.to_param}, valid_session
      }.to change(Item, :count).by(-1)
    end

    it 'redirects to the items list' do
      sign_in(FactoryGirl.create(:user))
      item = Item.create! valid_attributes
      delete :destroy, {:id => item.to_param}, valid_session
      expect(response).to redirect_to(items_url)
    end

  end

end
