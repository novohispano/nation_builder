class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :message

  belongs_to :user
  belongs_to :event
end