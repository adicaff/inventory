require 'rails_helper'

describe ItemsController do

  let(:valid_attributes) { {name: 'Test Item', description: 'Testing', location: 'Test field'} }
  let(:invalid_attributes) { {name: '' } }
  let(:user) {  User.new( {email: 'test@test.com', password: 'testtest'} ) }

  describe '#index' do
    context 'user correctly authenticated' do
      it 'assigns all items as @items' do
        item = FactoryGirl.create(:item, valid_attributes)
        sign_in(FactoryGirl.create(:user))

        get :index

        expect(assigns(:items)).to eq([item])
      end

      it 'should render correctly' do
        item = FactoryGirl.create(:item, valid_attributes)
        sign_in(FactoryGirl.create(:user))

        get :index

        expect(response).to render_template('index')
      end
    end

    context 'user not authenticated' do
      it('should render correctly')do
        get :index

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#show' do
    context 'user correctly authenticated' do
      it 'should correctly assign the item' do
        item = FactoryGirl.create(:item, valid_attributes)
        sign_in(FactoryGirl.create(:user))

        get :show, {:id => item.to_param}

        expect(assigns(:item)).to eq(item)
      end

      it 'should render correctly' do
        item = FactoryGirl.create(:item, valid_attributes)
        sign_in(FactoryGirl.create(:user))

        get :show, {:id => item.to_param}

        expect(response).to render_template('show')
      end
    end

    context 'user not authenticated' do
      it('should render correctly')do
        get :show, {:id => Faker::Name.name}

        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe '#new' do
    context 'user correctly authenticated' do
      it 'should correctly assign the new item' do
        sign_in(FactoryGirl.create(:user))

        get :new

        expect(assigns(:item)).to be_a_new(Item)
      end

      it 'should render correctly' do
        sign_in(FactoryGirl.create(:user))

        get :new

        expect(response).to render_template('new')
      end
    end

    context 'user not authenticated' do
      it('should render correctly')do
        get :new

        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe '#create' do
    context 'user correctly authenticated' do
      describe 'with valid params' do

        it 'creates a new Item' do
          sign_in(FactoryGirl.create(:user))

          expect {
            post :create, {:item => valid_attributes}
          }.to change(Item, :count).by(1)

        end

        it 'assigns a newly created item as @item' do
          sign_in(FactoryGirl.create(:user))
          post :create, {:item => valid_attributes}

          expect(assigns(:item)).to be_a(Item)
          expect(assigns(:item)).to be_persisted
        end

        it 'should render correctly' do
          sign_in(FactoryGirl.create(:user))

          post :create, {:item => valid_attributes}

          expect(response).to redirect_to(assigns(:item))
        end

      end

      describe 'with invalid params' do

        it 'assigns a newly created but unsaved item as @item' do
          sign_in(FactoryGirl.create(:user))

          post :create, {:item => invalid_attributes}

          expect(assigns(:item)).to be_a_new(Item)
        end

        it 're-renders the "new" template' do
          sign_in(FactoryGirl.create(:user))

          post :create, {:item => invalid_attributes}

          expect(response).to render_template('new')
        end

      end
    end

    context 'user not authenticated' do
      it('should render correctly')do
        post :create, {:item => invalid_attributes}

        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe '#update' do
    context 'user correctly authenticated' do
      describe 'with valid params' do

        let(:new_attributes) {
          {name: 'Updated Item', description: 'Updated', ubication: 'Test field'}
        }

        it 'updates the requested item' do
          sign_in(FactoryGirl.create(:user))
          item = FactoryGirl.create(:item, valid_attributes)

          put :update, {:id => item.to_param, :item => new_attributes}

          item.reload
          expect(assigns(:item)).to eq(item)
        end

        it 'assigns the requested item as @item' do
          sign_in(FactoryGirl.create(:user))
          item = FactoryGirl.create(:item, valid_attributes)

          put :update, {:id => item.to_param, :item => valid_attributes}

          expect(assigns(:item)).to eq(item)
        end

        it 'redirects to the item' do
          sign_in(FactoryGirl.create(:user))
          item = FactoryGirl.create(:item, valid_attributes)

          put :update, {:id => item.to_param, :item => valid_attributes}

          expect(response).to redirect_to(item)
        end

      end

      describe 'with invalid params' do

        it 'assigns the item as @item' do
          sign_in(FactoryGirl.create(:user))
          item = FactoryGirl.create(:item, valid_attributes)

          put :update, {:id => item.to_param, :item => invalid_attributes}

          expect(assigns(:item)).to eq(item)
        end

        it 'should render correctly' do
          sign_in(FactoryGirl.create(:user))
          item = FactoryGirl.create(:item, valid_attributes)

          put :update, {:id => item.to_param, :item => invalid_attributes}

          expect(response).to render_template('index')
        end

      end
    end

    context 'user not authenticated' do
      it('should render correctly') do
        item = FactoryGirl.create(:item, valid_attributes)
        put :update, {:id => item.to_param, :item => invalid_attributes}

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#destroy' do

    context 'user correctly authenticated' do

      it 'destroys the requested item' do
        sign_in(FactoryGirl.create(:user))
        item = FactoryGirl.create(:item, valid_attributes)

        expect {
          delete :destroy, {:id => item.to_param}
        }.to change(Item, :count).by(-1)

      end

      it 'redirects to the items list' do
        sign_in(FactoryGirl.create(:user))
        item = FactoryGirl.create(:item, valid_attributes)

        delete :destroy, {:id => item.to_param}

        expect(response).to redirect_to(items_url)
      end
    end

    context 'user not authenticated' do
      it('should render correctly') do
        item = FactoryGirl.create(:item, valid_attributes)
        delete :destroy, {:id => item.to_param}

        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

end
