# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserBulkExportService do
  describe '#call' do
    it 'returns a compressed filestream' do
      service = UserBulkExportService.new
      compressed_filestream = service.call

      expect(compressed_filestream).to be_a(StringIO)
    end

    it 'rewinds the file pointer' do
      service = UserBulkExportService.new
      compressed_filestream = service.call

      expect(compressed_filestream.pos).to eq(0)
    end
  end
end
