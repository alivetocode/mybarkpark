require 'spec_helper'

describe Owner do

  let(:blank) { [nil, ""] }

  it { should have_many(:dogs).dependent(:destroy) }

  it { should have_valid(:first_name).when("Mary") }
  it { should_not have_valid(:first_name).when(*blank) }

  it { should have_valid(:last_name).when("Poppins") }
  it { should_not have_valid(:last_name).when(*blank) }




end
