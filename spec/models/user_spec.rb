require 'rails_helper'

describe User do
  context 'validations' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :email }
    subject { FactoryGirl.build(:user) }
    it { is_expected.to validate_uniqueness_of :username }
    it { is_expected.to validate_uniqueness_of :email }
  end
end
