require 'rails_helper'

RSpec.describe ProductsController do
  context '#create' do
    it 're-renders the form if the name is invalid 'do
      post :create, params: { product: { name: nil } }

      expect(response).to render_template(:new)
    end
  end

  context '#update' do
    it 're-renders the form if the name is invalid' do
      store = Store.new
      product_to_update = Product.create(name: 'Test Product', category: 'Abcdef', price: 1000, store: store)

      put :update, params: { id: product_to_update.id, product: { name: nil } }

      expect(response).to render_template(:edit)
    end
  end

  context '#index' do
    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'assigns @products' do
      store = Store.new
      product = Product.create(name: 'Test Product', category: 'Abcdef', price: 1000, store: store)

      get :index

      expect(assigns(:products)).to eq([product])
    end
  end
end