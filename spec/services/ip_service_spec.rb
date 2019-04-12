require 'rails_helper'

RSpec.describe IpService do
  let!(:params1) { attributes_for(:post, user_ip: '1.2.3.4', username: 'user1') }
  let!(:params2) { attributes_for(:post, user_ip: '1.2.3.4', username: 'user2') }
  let!(:params3) { attributes_for(:post, user_ip: '6.7.8.9', username: 'user3') }
  let!(:params4) { attributes_for(:post, user_ip: '4.3.2.1', username: 'user4') }
  let!(:params5) { attributes_for(:post, user_ip: '4.3.2.1', username: 'user5') }
  let!(:expected_result) do
    [
      { ip: '1.2.3.4', users: ['user1', 'user2'] },
      { ip: '4.3.2.1', users: ['user4', 'user5'] }
    ]
  end

  describe '#.find_users' do
    before do
      PostCreateService.create(params1)
      PostCreateService.create(params2)
      PostCreateService.create(params3)
      PostCreateService.create(params4)
      PostCreateService.create(params5)
    end

    it 'returns array of ip groups' do
      result = IpService.find_users

      result.each do |group|
        ip = group[:ip]
        expected_users = expected_result.find { |e| e[:ip] == ip }[:users]

        expect(group[:users]).to contain_exactly(*expected_users)
      end
    end
  end
end