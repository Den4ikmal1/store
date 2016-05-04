class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews

  def role?(r)
    role.include? r.to_s
  end

  def self.found_country(ipaddress)
    geo = Maxminddb.lookup(ipaddress)
      if geo.found?
        geo.country.name
      end
  end
end
