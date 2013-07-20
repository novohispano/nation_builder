class Seeder
  def create_data
    100.times do
      create_user
      create_event
      sleep(Random.rand(1..5))
    end
  end

  private

  def create_user
    first_name = Faker::Name.first_name
    last_name  = Faker::Name.last_name

    user = User.create(name: "#{first_name} #{last_name}")
    puts "Created user #{user.name}"
  end

  def create_event
    event = Event.create(type: events[Random.rand(0..3)])
    event.users << User.first
    event.users << User.last if event.type == "high-five-another-user"

    puts "Created event #{event.id}"
  end

  def events
    [
      "enter-the-room",
      "leave-the-room",
      "comment",
      "high-five-another-user"
    ]
  end
end

Seeder.new.create_data