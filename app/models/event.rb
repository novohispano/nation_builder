class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :action
  field :type

  has_and_belongs_to_many :users
end