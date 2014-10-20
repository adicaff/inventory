require 'rails_helper'

describe HashtagsController do
  let(:api_client) { double(:api_client) }

  describe '#show' do
    let(:hashtag) { 'goal' }

    it 'should assign hashtag\'s tweets correctly' do
      tweets = double(:hashtag_tweets)

      allow(controller).to receive(:connect_api).and_return(api_client)
      expect(api_client).to receive(:hashtag).with(hashtag).and_return(tweets)

      get :show, id: hashtag

      expect(assigns[:hashtag_tweets]).to eq(tweets)
    end

    it 'renders the correct template' do
      tweets = double(:hashtag_tweets)

      allow(controller).to receive(:connect_api).and_return(api_client)
      allow(api_client).to receive(:hashtag).with(hashtag).and_return(tweets)

      get :show, id: hashtag

      expect(response).to render_template('show')
    end

  end

  describe '#share' do
    let(:url) { 'https://hello.com' }

    it 'renders the correct template' do
      page = double(:page)

      allow(MetaInspector).to receive(:new).with(url).and_return(page)

      get :share, url: url

      expect(response).to render_template('share')
    end

  end

end