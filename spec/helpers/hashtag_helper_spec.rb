require 'rails_helper'
require 'rspec-html-matchers'

describe HashtagHelper do

  describe '#show_share_content' do

    context 'given empty url' do

      it 'should return nil' do
        url = nil

        expect(helper.show_share_content(url)).to be_nil
      end
    end

    context 'given correct url' do
        url = 'http://www.google.com.uy'

        it 'should return share div tag' do
          expect(helper.show_share_content(url)).to have_tag(:div, :with => { :class => 'share' })
        end

        it 'should return text-right div tag' do
          expect(helper.show_share_content(url)).to have_tag(:div, :with => { :class => 'text-right' })
        end

        it 'should return loading image' do
          expect(helper.show_share_content(url)).to have_tag(:img, :with => { :alt => 'Loading' } )
        end

    end
  end

end