class Facility
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :zones
  has_many :enqueued_classification_requests

  field :name, type: String
  field :user_id, type: String
end