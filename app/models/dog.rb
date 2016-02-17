class Dog < ActiveRecord::Base
  belongs_to :owner,
  inverse_of: :dogs

  has_many :check_ins,
  inverse_of: :dog

  has_many :parks,
    through: :check_ins

  GENDER = ['Male', 'Female']
  validates_presence_of :name
  validates_presence_of :owner
  validates_inclusion_of :gender, :in => GENDER, :message => "...please type Male or Female"

  mount_uploader :photo_url, PhotoUrlUploader

end
