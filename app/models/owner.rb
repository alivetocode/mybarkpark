class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dogs,
    dependent: :destroy,
    inverse_of: :owner

  validates_presence_of :first_name
  validates_presence_of :last_name

  mount_uploader :photo_url, PhotoUrlUploader

  def full_name
    "#{first_name} #{last_name}"
  end

end

# GENDERS = %w[male female]
# validates :genders, inclusion: { in: GENDERS }
