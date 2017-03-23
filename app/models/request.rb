class Request < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def price
  	self.room.price*nights
  end

  def nights
    (((self.out.end_of_day - self.in.beginning_of_day).to_i)/1.day)
  end
end
