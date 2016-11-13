class Facility
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :zones, dependent: :delete

  field :name, type: String
  field :user_id, type: String
end