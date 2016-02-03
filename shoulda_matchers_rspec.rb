require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:identities).dependent(:destroy) }
  it { is_expected.to have_many(:ssh_keys).dependent(:destroy) }
  it { is_expected.to have_and_belong_to_many(:babl_modules).dependent(:destroy) }
end