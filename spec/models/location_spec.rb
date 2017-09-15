require 'rails_helper'

describe Location do
  context 'validations' do
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
    subject { FactoryGirl.build(:location)}
    it { is_expected.to validate_uniqueness_of(:latitude).scoped_to :longitude }
    context 'has_findable_address' do
      it 'returns true with a valid address' do
        location = Location.new(address: "test")
        expect(location.has_findable_address).to be true
      end
      it 'returns false with an invalid address' do
        location = FactoryGirl.build(:location)
        expect(location.has_findable_address).to be false
      end
    end
  end
end
