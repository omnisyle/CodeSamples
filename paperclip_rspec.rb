require 'rails_helper'
require 'rack/test'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = create_user_sign_in
    @photo_image_file = Rack::Test::UploadedFile.new(Rails.root + "spec/test_images/photos/photo_#{ rand(1..4) }.jpg", 'image/jpeg')
  end

  describe 'POST #create' do
    it 'should create post with photo' do
      expect {
        post :create, post: { description: FFaker::Lorem.phrase+ " #random #hashtags #yoo", image: @photo_image_file }
      }.to change {
        Post.count
      }.by 1
    end
  end
end