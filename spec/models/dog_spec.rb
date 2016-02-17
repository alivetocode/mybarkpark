require 'spec_helper'

describe Dog do

  let(:blank) { [nil, ''] }

  it { should belong_to(:owner) }


  it { should have_valid(:name).when("melon") }
  it { should_not have_valid(:name).when(*blank) }

  it { should have_valid(:owner).when(Owner.new) }
  it { should_not have_valid(:owner).when(nil) }
end

