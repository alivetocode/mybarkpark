require 'spec_helper'
# Use Carrierwave's provided test matchers
require 'carrierwave/test/matchers'

describe PhotoUrlUploader do
  include CarrierWave::Test::Matchers

  let(:uploader) do
    PhotoUrlUploader.new(FactoryGirl.build(:owner),
      :photo_url)
  end

  let(:path) do
    Rails.root.join('spec/file_fixtures/myphoto.jpg')
  end

  before do
    PhotoUrlUploader.enable_processing = true
  end

  after do
    PhotoUrlUploader.enable_processing = false
  end

  it 'stores without error' do
    expect(lambda { uploader.store!(File.open(path)) }).to_not raise_error
  end
end
