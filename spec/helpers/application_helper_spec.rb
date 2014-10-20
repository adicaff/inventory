require 'rails_helper'

describe ApplicationHelper do

  describe '#extract_url' do

    context 'given text without url' do

      it 'should return nil' do
        url = 'hello how are you?'

        expect(helper.extract_url(url, 'http')).to be_nil
      end
    end

    context 'given correct url' do

      it 'should return the url correctly' do
        url = 'http://www.google.com.uy'
        text = "Hello how #{url} are you?"

        expect(helper.extract_url(text, 'http')).to eq(url)
      end
    end
  end

end