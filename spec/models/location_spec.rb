require 'rails_helper'

describe Location do
  context 'validations' do
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
    it { is_expected.to validate_uniqueness_of(:latitude).scoped_to :longitude }
  end
end
