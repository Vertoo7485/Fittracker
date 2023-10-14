# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#nav_tab' do
    it 'returns link with correct CSS class when current_page matches title' do
      current_page = 'Home'
      html_options = { class: 'navbar-link' }

      link = helper.nav_tab('Home', root_path, current_page:, options: html_options)

      expect(link).to include('class="text-secondary"')
    end

    it 'returns link with default CSS class when current_page does not match title' do
      current_page = 'About'
      html_options = { class: 'navbar-link' }

      link = helper.nav_tab('Home', root_path, current_page:, options: html_options)

      expect(link).to include('class="text-white"')
    end
  end

  describe '#currently_at' do
    it 'renders partial with correct local variable' do
      allow(helper).to receive(:render) do |options|
        expect(options[:partial]).to eq('shared/menu')
        expect(options[:locals]).to eq({ current_page: 'Home' })
      end

      helper.currently_at('Home')
    end
  end

  describe '#full_title' do
    it 'returns base title when page title is empty' do
      expect(helper.full_title).to eq('FitTracker')
    end

    it 'returns combined title when page title is present' do
      page_title = 'About'
      expect(helper.full_title(page_title)).to eq('About | FitTracker')
    end
  end
end
