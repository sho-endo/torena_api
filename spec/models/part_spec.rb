require 'rails_helper'

RSpec.describe Part, type: :model do
  let(:part) { create(:part) }

  it 'has a valid factory' do
    expect(create(:part)).to be_truthy
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :user_id }

    it 'name should be should be less than 30 characters' do
      part.name = 'a' * 31
      expect(part).to_not be_valid

      part.name = 'a' * 30
      expect(part).to be_valid
    end

    it 'does not allow duplicate part names per user' do
      duplicated_part = part.dup
      expect(duplicated_part).not_to be_valid
    end
  end

  it 'associated menus should be destroyed' do
    part.menus.create(name: 'ショルダープレス')

    expect{ part.destroy }.to change{ Menu.count }.by(-1)
  end
end
