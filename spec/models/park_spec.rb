require 'spec_helper'

describe Park do

  let(:blank) { [nil, false] }

  it { should have_many(:check_ins) }

  it { should have_valid(:name).when("Wilmington Dog Park") }
  it { should_not have_valid(:name).when(*blank) }

  it { should have_valid(:address).when("128 Park Street") }
  it { should_not have_valid(:address).when(*blank) }
end
