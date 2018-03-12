require 'rails_helper'
require 'faker'

RSpec.describe Post, type: :model do
  let(:postable) { Barbershop.new }
  let(:postable) { User.new }
  before do
    postable.save(validate: false)
  end

  context 'validation tests' do
    it 'ensures post title present' do
      post = Post.new(postable: postable, body: Faker::Hipster.paragraph(2)).save
      expect(post).to eq(false)
    end

    it 'ensures post body present' do
      post = Post.new(postable: postable, title: 'Test Post Title').save
      expect(post).to eq(false)
    end

    it 'ensures user post is saved successfully' do
      post = Post.new(postable: postable, title: 'Test Post Title', body: Faker::Hipster.paragraph(2)).save
      expect(post).to eq(true)
    end

    it 'ensures barbershop post is saved successfully' do
      post = Post.new(postable: postable, title: 'Test Post Title', body: Faker::Hipster.paragraph(2)).save
      expect(post).to eq(true)
    end
  end
end
