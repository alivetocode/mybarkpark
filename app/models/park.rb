class Park < ActiveRecord::Base

  has_many :check_ins,
    inverse_of: :park

  has_many :dogs,
    through: :check_ins


  US_STATES = ['AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL','IN',
    'IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH',
    'NJ','NM','NY','NC','ND','OH','OK','OR','PA','PR','RI','SC','SD','TN','TX',
    'UT','VT','VA','WA','WV','WI','WY']

  validates :name, :presence => true, :uniqueness => true
  validates :address, :presence => true, :uniqueness => true
  validates_presence_of :city
  validates_presence_of :state
  validates_inclusion_of :state, :in => US_STATES, :message => "...please abbreviate using two capitalized letters...example KS if Kansas "
  validates_presence_of :zip_code
  validates_format_of :zip_code,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "invalid: format should be 12345 or 12345-1234",
                  allow_blank: true

  def check_in_for(dog)
    active_check_ins.find_by(dog_id: dog.id)
  end

  def active_check_ins
    check_ins.where(check_out_at: nil)
  end


end
