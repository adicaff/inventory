require 'rails_helper'

describe UsersController do
  let(:api_client) { double(:api_client) }

  describe '#show' do
    let(:user) { 'joaquin' }

    it 'should correctly assign user\'s bio' do
      timeline = double(:user_tweets)
      bio = double(:user_bio)

      allow(controller).to receive(:connect_api).and_return(api_client)
      allow(api_client).to receive(:timeline).with(user).and_return(timeline)
      expect(api_client).to receive(:user_bio).with(user).and_return(bio)

      get :show, id: user

      expect(assigns[:user_bio]).to eq(bio)
    end

    it 'should correctly assing user\'s tweets' do
      timeline = double(:user_tweets)
      bio = double(:user_bio)

      allow(controller).to receive(:connect_api).and_return(api_client)
      allow(api_client).to receive(:user_bio).with(user).and_return(bio)
      expect(api_client).to receive(:timeline).with(user).and_return(timeline)

      get :show, id: user

      expect(assigns[:user_tweets]).to eq(timeline)
    end

    it 'renders the correct template' do
      timeline = double(:user_tweets)
      bio = double(:user_bio)

      allow(controller).to receive(:connect_api).and_return(api_client)
      allow(api_client).to receive(:user_bio).with(user).and_return(bio)
      allow(api_client).to receive(:timeline).with(user).and_return(timeline)

      get :show, id: user

      expect(response).to render_template('show')
    end

  end

end