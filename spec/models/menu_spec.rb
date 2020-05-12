require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'has a valid factory' do
    expect(create(:menu)).to be_truthy
  end

  describe 'validation' do
    let(:menu) { create(:menu) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :part_id }

    it 'name should be should be less than 50 characters' do
      menu.name = 'a' * 51
      expect(menu).to_not be_valid

      menu.name = 'a' * 50
      expect(menu).to be_valid
    end

    it 'does not allow duplicate menu names per part' do
      duplicated_menu = menu.dup
      expect(duplicated_menu).not_to be_valid
    end
  end
end
