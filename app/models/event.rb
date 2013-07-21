class Event
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type

  has_and_belongs_to_many :users
  has_one :comment

  def self.by_hour
    self.all.asc(:created_at).group_by do |event|
      event.created_at.strftime("%B %d, %Y - %l %p")
    end
  end
end