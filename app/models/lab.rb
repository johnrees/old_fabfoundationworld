class Lab
  include Mongoid::Document
  validates_presence_of :name, :kind
  validates_uniqueness_of :name
  field :name

  KINDS = %w[fab_lab mini planned]

  field :kind

  embeds_one :address
  embeds_many :contacts
  embeds_many :websites

  accepts_nested_attributes_for :contacts, :websites, :address,
    allow_destroy: true


  field :hours
  field :collaborators
  field :comments

  field :facilities
  field :languages

  def to_s
    name
  end

end

class Address
  include Mongoid::Document
  embedded_in :labs
  field :formatted
  field :building
  field :street
  field :city
  field :zip
  field :country
  field :latitude
  field :longitude
end

class Contact
  include Mongoid::Document
  embedded_in :labs
  field :name
  field :role
  field :email
  field :phone
  field :fax
end

class Website
  include Mongoid::Document
  embedded_in :labs
  field :name
  field :url
end