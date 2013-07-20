class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :action

  has_and_belongs_to_many :users
end