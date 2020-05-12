require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }

    it 'password should be 6 characters or more' do
      user = build(:user, password: 'a' * 5)
      expect(user).to_not be_valid

      user.password = 'a' * 6
      expect(user).to be_valid
    end

    it 'email should be less than 256 characters' do
      user = build(:user, email: 'a' * 244 + '@example.com')
      expect(user).to_not be_valid

      user = build(:user, email: 'a' * 243 + '@example.com')
      expect(user).to be_valid
    end

    it 'email validation should accept valid addresses' do
      user = build(:user)
      valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn)
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it 'email validation should reject invalid addresses' do
      user = build(:user)
      invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com)
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end

    it 'email addresses should be unique' do
      user = create(:user)
      duplicate_user = user.dup
      expect(duplicate_user).to_not be_valid
    end
  end

  describe '#downcase_email' do
    it 'email should be lowercase' do
      user = build(:user, email: 'TEST@EXAMPLE.COM')
      expect(user.send(:downcase_email)).to eq 'test@example.com'
    end

    it 'should be performed before save' do
      user = build(:user, email: 'TEST@EXAMPLE.COM')
      user.save!
      expect(user.reload.email).to eq 'test@example.com'
    end
  end
end
