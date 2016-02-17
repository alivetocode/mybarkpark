class CheckIn < ActiveRecord::Base
  belongs_to :dog,
  inverse_of: :check_ins

  belongs_to :park,
  inverse_of: :check_ins

end
