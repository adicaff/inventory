require 'rails_helper'

describe TrendsController do
  let(:api_client) { double(:api_client) }

  describe '#show' do
    let(:trend_id) { rand(1000).to_s }

    it 'should correctly assign the trends' do
      trends = double(:trends)

      allow(controller).to receive(:connect_api).and_return(api_client)
      expect(api_client).to receive(:trends).with(trend_id).and_return(trends)

      get :show, id: trend_id

      expect(assigns[:trends]).to eq(trends)
    end

    it 'renders the correct template' do
      trends = double(:trends)

      allow(controller).to receive(:connect_api).and_return(api_client)
      allow(api_client).to receive(:trends).with(trend_id).and_return(trends)

      get :show, id: trend_id

      expect(response).to render_template('show')
    end

  end

  describe '#index' do

    it 'renders the correct template' do

      get :index

      expect(response).to render_template('index')
    end

  end

end