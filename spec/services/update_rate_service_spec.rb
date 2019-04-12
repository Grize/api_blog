require 'rails_helper'

RSpec.describe UpdateRateService do
  let!(:post) do
    Post.find(
      PostCreateService.create(attributes_for(:post)).post_id
    )
  end

  describe 'validations check' do
    let(:rate_params) { { rate: rand(0..5) } }
    let(:valid_handler) { UpdateRateService.new(rate_params, post) }

    it 'everything ok' do
      expect(valid_handler).to be_valid
    end

    it 'should validate presence of post' do
      invalid_handler = UpdateRateService.new(rate_params, nil)

      expect(invalid_handler).to_not be_valid
      expect(invalid_handler.errors[:post]).to be
    end

    it 'should validate presence of rate' do
      invalid_handler = UpdateRateService.new({ }, post)

      expect(invalid_handler).to_not be_valid
      expect(invalid_handler.errors[:rate]).to be
    end

    it 'should validate value of rate - must be 5 or less' do
      invalid_handler = UpdateRateService.new({rate: 6}, post)

      expect(invalid_handler).to_not be_valid
      expect(invalid_handler.errors[:rate]).to be
    end

    it 'should validate value of rate - must be 1 or more' do
      invalid_handler = UpdateRateService.new({rate: 0}, post)

      expect(invalid_handler).to_not be_valid
      expect(invalid_handler.errors[:rate]).to be
    end
  end

  describe '#update' do
    context 'with valid params' do
      it 'update post rating' do
        expect { UpdateRateService.new({rate: 5}, post).update_rate}.to change(post, :total_rating).from(0).to(5)
      end
    end
  end
end