class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type

  has_and_belongs_to_many :users
end