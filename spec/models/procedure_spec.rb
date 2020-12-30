# frozen_string_literal: true

RSpec.describe Procedure, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { expect(build(:procedure)).to validate_uniqueness_of(:name) }
  end
end
