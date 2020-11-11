class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    errors = ["Sorry."]
    check_tickets(errors, user, attraction)
    check_height(errors, user, attraction)

    no_errors?(errors) ? update_user(user, attraction) : errors.join(" ")
  end

  def check_tickets(errors, user, attraction)
    errors << "You do not have enough tickets to ride the #{attraction.name}." if user.tickets < attraction.tickets
  end

  
  def check_height(errors, user, attraction)
    errors << "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
  end

  def no_errors?(errors)
    errors == ["Sorry."]
  end

  def update_user(user, attraction)
    user.tickets -= attraction.tickets
    user.happiness += attraction.happiness_rating
    user.nausea += attraction.nausea_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end
end
